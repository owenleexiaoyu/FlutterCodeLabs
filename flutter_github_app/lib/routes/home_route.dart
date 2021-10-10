import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_github_app/common/git_api.dart';
import 'package:flutter_github_app/models/repo.dart';
import 'package:flutter_github_app/routes/home_drawer.dart';
import 'package:flutter_github_app/states/profile_change_notifier.dart';
import 'package:flutter_github_app/widgets/index.dart';
import 'package:provider/provider.dart';

class HomeRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Github"),
      ),
      body: _buildBody(),
      drawer: HomeDrawer(),
    );
  }

  Widget _buildBody() {
    UserModel userModel = Provider.of<UserModel>(context);
    if (!userModel.isLogin) {
      return Center(
        child: ElevatedButton(
          child: Text("Login"),
          onPressed: () {
            Navigator.of(context).pushNamed("logion");
          },
        ),
      );
    } else {
      return InfiniteListView<Repo>(
          onRetrieveData: (int page, List<Repo> items, bool refresh) async {
        var data = await Git(context).getRepos(queryParameters: {
          "page": page,
          "page_size": 20,
        }, refresh: refresh);
        //把请求到的新数据添加到items中
        items.addAll(data);
        return data.length > 0 && data.length % 20 == 0;
      }, itemBuilder: (List list, int index, BuildContext ctx) {
        return RepoItem(list[index]);
      });
    }
  }
}
