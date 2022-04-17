# flutter_spotify_ui

## 背景信息

> 视频来源：[「Flutter」- 带你实现桌面端和web端的Spotify - Bilibili](https://www.bilibili.com/video/BV1sh411q7Qp?spm_id_from=333.999.0.0)
> 起步项目：[https://github.com/MarcusNg/flutter_spotify_ui/tree/starter_project](https://github.com/MarcusNg/flutter_spotify_ui/tree/starter_project)
> 完整代码：[https://github.com/MarcusNg/flutter_spotify_ui](https://github.com/MarcusNg/flutter_spotify_ui)


这是一个对 Spotify 软件的 UI 仿写教程，还原 Web 和桌面端的界面。

使用到的插件：

- desktop_window：可以设定桌面端软件的最大最小尺寸。
- provider：负责状态管理

## macOS 配置

支持 macOS：

```javascript
flutter config --enable-macos-desktop
```

编译运行 macOS：

```javascript
// debug
flutter run -d macOS

// release
flutter build macos
```

## 开发细节

1. 在编写界面之前就定义好主题，定义常用的主题色，高亮色，常用的 TextTheme，这样在开发时不用纠结颜色与文字风格。

```dart
themeMode: ThemeMode.dark,
darkTheme: ThemeData(
  brightness: Brightness.dark,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
  scaffoldBackgroundColor: const Color(0xFF121212),
  backgroundColor: const Color(0xFF121212),
  primaryColor: Colors.black,
  accentColor: const Color(0xFF1DB954),
  iconTheme: const IconThemeData().copyWith(color: Colors.white),
  fontFamily: 'Montserrat',
  textTheme: TextTheme(
    headline2: const TextStyle(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      fontSize: 12.0,
      color: Colors.grey[300],
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0,
    ),
    bodyText1: TextStyle(
      color: Colors.grey[300],
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.0,
    ),
    bodyText2: TextStyle(
      color: Colors.grey[300],
      letterSpacing: 1.0,
    ),
  ),
),
```

2. 在 main() 函数中，如果有异步代码调用，或者需要调用平台相关的原生代码，需要先保证有 WidgetBinding 实例：`WidgetsFlutterBinding.ensureInitialized();`
   - [stackoverflow.com - what does WidgetsFlutterBinding.ensureinitialized() do?](https://stackoverflow.com/questions/63873338/what-does-widgetsflutterbinding-ensureinitialized-do)
3. 判断是否是 Web 平台：`kIsWeb`，在判断平台上需要放在最前。
3. 判断是哪个平台（适用于移动端、桌面端）：
   - `Platform.isMacOS`
   - `Platform.isWindows`
   - `Platform.isLinux`
   - `Platform.isIOS`
   - `Platform.isAndroid`
5. 给桌面端设置最小宽高，避免缩放时元素溢出：`DesktopWindow.setMinWindowSize(Size(800, 600))`
5. 使用 provider 中的 `ChangeNotifierProvider` 来创建全局可观察的 Model。
   -  `ChangeNotifierProvider` 包裹 MyApp 组件
   - Model 类需要继承自 `ChangeNotifier`
   - 使用 `context.read<Model>()` 来获取全局的 Model
   - 使用 `context.watch<Model>()` 来监听全局 Model 的变化
```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 在桌面端设置应用的最小宽高 800 * 600
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(Size(800, 600));
  }
  runApp(ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(),
      child: MyApp()
  ));
}
```
```dart
class CurrentTrackModel extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners(); // 通知观察者
  }

}
```

7. 创建表格可以用 `DataTable` 组件，`columns` 属性用于指定表格的列，接收 `DataColumn` 列表，`rows` 属性表示表格的行，接收 `DataRow` 的列表。DataRow 的 `cells` 对应一个个单元格，个数应该与 Table  的列数对齐，每个单元格用 `DataCell` 表示。

```dart
@override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.overline!.copyWith(fontSize: 12.0),
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
        columns: const [
          DataColumn(label: Text("TITLE",)),
          DataColumn(label: Text("ARTIST",)),
          DataColumn(label: Text("AUBUM",)),
          DataColumn(label: Icon(Icons.access_time)),
        ],
        rows: tracklist.map((e) {
          final selected = context.watch<CurrentTrackModel>().selected?.id == e.id;
          final textStyle = TextStyle(color: selected ? Theme.of(context).accentColor : Theme.of(context).iconTheme.color);
          return DataRow(cells: [
            DataCell(Text(e.title, style:textStyle)),
            DataCell(Text(e.artist, style: textStyle)),
            DataCell(Text(e.album, style: textStyle)),
            DataCell(Text(e.duration, style: textStyle)),
          ],
          selected: selected,
          onSelectChanged: (_) {
            context.read<CurrentTrackModel>().selectTrack(e);
          });
        }).toList(),);
  }
```

