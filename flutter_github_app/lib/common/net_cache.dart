// ignore: import_of_legacy_library_into_null_safe
import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter_github_app/common/Global.dart';

class CacheObject {
  CacheObject(this.response)
      : timeStamp = DateTime.now().millisecondsSinceEpoch;
  Response response;
  int timeStamp;

  @override
  bool operator ==(Object other) {
    return response.hashCode == other.hashCode;
  }

  @override
  int get hashCode => response.realUri.hashCode;
}


/// option.extra
/// refresh (bool): 如果为true，则本次请求不使用缓存，但新的请求结果仍然会被缓存
/// noCache (bool): 本次请求禁用缓存，请求结果也不会被缓存
class NetCache extends Interceptor {
  // 为了确保迭代器顺序和对象插入时间一致顺序一致，我们使用 LinkedHashMap
  var cache = LinkedHashMap<String, CacheObject>();

  @override
  onRequest(RequestOptions options) async {
    if (!Global.profile.cache.enable) return options;
    bool refresh = options.extra["refresh"] == true;
    if (refresh) {
      if (options.extra["list"] == true) {
        cache.removeWhere((key, value) => key.contains(options.path));
      } else {
        delete(options.uri.toString());
      }
      return options;
    }
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      var ob = cache[key];
      if (ob != null) {
        // 若缓存未过期，则返回缓存内容
        if ((DateTime.now().millisecondsSinceEpoch - ob.timeStamp) / 1000 <
            Global.profile.cache.maxAge) {
          return ob.response;
        } else {
          cache.remove(key);
        }
      }
    }
    return super.onRequest(options);
  }

  @override
  onResponse(Response response) async {
    // 如果启用缓存，将返回结果保存到缓存
    if (Global.profile.cache.enable) {
      _saveCache(response);
    }
  }

  _saveCache(Response response) {
    RequestOptions options = response.request;
    if (options.extra["noCache"] != true &&
        options.method.toLowerCase() == "get") {
      if (cache.length == Global.profile.cache.maxCount) {
        cache.remove(cache[cache.keys.first]);
      }
      String key = options.extra["cacheKey"] ?? options.uri.toString();
      cache[key] = CacheObject(response);
    }
  }

  void delete(String key) {
    cache.remove(key);
  }
}
