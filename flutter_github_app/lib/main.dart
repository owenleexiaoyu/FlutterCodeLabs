import 'package:flutter/material.dart';
import 'package:flutter_github_app/routes/home_route.dart';
import 'package:flutter_github_app/routes/LanguageRoute.dart';
import 'package:flutter_github_app/routes/LoginRoute.dart';
import 'package:flutter_github_app/routes/ThemesRoute.dart';
import 'package:flutter_github_app/states/profile_change_notifier.dart';
import 'package:provider/provider.dart';

import 'common/Global.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildCloneableWidget>[
        ChangeNotifierProvider.value(value: ThemeModel()),
        ChangeNotifierProvider.value(value: UserModel()),
        ChangeNotifierProvider.value(value: LocaleModel()),
      ],
      child: Consumer2<ThemeModel, LocaleModel>(
        builder: (BuildContext context, themeModel, localModel, Widget child) {
          return MaterialApp(
            theme: ThemeData(
              primarySwatch: themeModel.theme,
            ),
            onGenerateTitle: (context) {
              return "Github";
            },
            home: HomeRoute(),
            locale: localModel.getLocale(),
            supportedLocales: [
              const Locale("zh", "CN"),// 中文简体
              const Locale("en", "US"),// 美国英语
              //其它Locales
            ],
            routes: <String, WidgetBuilder>{
              "login": (context) => LoginRoute(),
              "themes": (context) => ThemesRoute(),
              "language": (context) => LanguageRoute(),
            },
          );
        },
      ),
    );
  }
}