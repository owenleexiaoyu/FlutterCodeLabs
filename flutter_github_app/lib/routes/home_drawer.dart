import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_github_app/common/funs.dart';
import 'package:flutter_github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: MediaQuery.removePadding(context: context,
            removeTop: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(), // 构建抽屉菜单头部
                Expanded(child: _buildMenus()),
              ],
            ))
    );
  }

  Widget _buildHeader() {
    return Consumer<UserModel>(
        builder: (BuildContext context, UserModel value, Widget child) {
          return GestureDetector(
            child: Container(
              color: Theme
                  .of(context)
                  .primaryColor,
              padding: EdgeInsets.only(top: 40, bottom: 20),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ClipOval(
                        child: value.isLogin ? gmAvatar(
                            value.user!.avatar_url, width: 80, height: 80)
                            : Image.asset(
                          "imgs/avatar-default.png", width: 80,),
                      )
                  ),
                  Text(value.isLogin ? value.user!.login : "Login", style:
                  TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),
                ],
              ),
            ),
            onTap: () {
              if (!value.isLogin) {
                Navigator.pushNamed(context, "login");
              }
            },
          );
        }
    );
  }

  Widget _buildMenus() {
    return Consumer<UserModel?>(
      builder: (BuildContext context, UserModel? userModel, Widget child) {
        return ListView(
          children: [
            ListTile(
              leading: Icon(Icons.color_lens),
              title: Text("Theme"),
              onTap: () => Navigator.pushNamed(context, "themes"),
            ),
            ListTile(
              leading: Icon(Icons.language),
              title: Text("Language"),
              onTap: () => Navigator.pushNamed(context, "language"),
            ),
            if (userModel?.isLogin) ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Logout"),
              onTap: () {
                showDialog(context: context, builder: (ctx) {
                  return AlertDialog(content: Text("Logout?"),
                    actions: <Widget>[
                      TextButton(
                        child: Text("Cancel"),
                        onPressed: () => Navigator.pop(context),
                      ),
                      TextButton(
                        child: Text("Yes"),
                        onPressed: () {
                          userModel = null;
                          Navigator.pop(context);
                        },
                      )
                    ],);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
