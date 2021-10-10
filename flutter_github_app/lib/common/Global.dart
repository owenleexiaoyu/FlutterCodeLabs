import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/net_cache.dart';
import 'package:flutter_github_app/models/cacheConfig.dart';
import 'package:flutter_github_app/models/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'git_api.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.pink,
  Colors.red
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();

  // 网络缓存对象
  static NetCache netCache = new NetCache();

  // 可选的主体列表
  static List<MaterialColor> get themes => _themes;

  // 是否为 release 版本
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  // 初始化全局信息，会在App启动时执行
  static Future init() async {
    // 初始化 sp
    _prefs = await SharedPreferences.getInstance();
    // 从 sp 中读取缓存的 profile 配置，并反序列化
    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print(e);
      }
    }
    // 初始化缓存数据
    profile.cache = profile.cache ?? CacheConfig()
      ..enable = true
      ..maxAge = 3600
      ..maxCount = 100;

    Git.init();
  }

  // 持久化 profile 信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));
}
