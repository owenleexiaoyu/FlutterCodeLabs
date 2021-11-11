在 Biblibili 上找到一个 Flutter 视频教程，构建一个健身主题的视频播放应用。

## 健身主题 App UI

第一集：[Flutter App Tutorial for Beginners Step by Step 2021 GetX Complex UI Train](https://bilibili.com/video/BV1hv411A7Xd?spm_id_from=333.999.0.0)

这一集主要是编写首页的UI，效果如下图所示，还是很美观的：

<img src="https://gitee.com/owenlee233/image_store/raw/master/202109240024320.png" alt="效果截图" style="zoom: 33%;" />

## 视频播放器

第二集：[Futter视频播放器教程 Controls and Fullscreen | Aspect Ratio ListView | Slider Example](https://www.bilibili.com/video/BV1eb4y127Jv?spm_id_from=333.999.0.0)

这集主要内容是编写视频播放页的 UI，以及播放网络视频的功能，效果如图所示：

<img src="https://gitee.com/owenlee233/image_store/raw/master/202109240030235.png" alt="效果截图" style="zoom:33%;" />

<img src="https://gitee.com/owenlee233/image_store/raw/master/202111120029266.png" alt="videoplayer" style="zoom:33%;" />

播放器使用了 [video_player](https://pub.dev/packages/video_player) 这个三方库，这个三方库可以非常方便地控制视频的播放、暂停等功能。

当点击图中列表中的一个视频项时，会开始初始化播放器：

```dart
  void _initializeVideo(int index) async {
   	// 创建一个播放器控制器，将视频地址传入
    final controller = VideoPlayerController.network(videoInfos[index]["videoUrl"]);
    // 保存之前的播放控制器，后续做一些资源释放的工作
    final oldController = _videoPlayerController;
    // 将新的播放控制器，保存到一个全局变量中
    _videoPlayerController = controller;
    // 旧播放控制器暂停播放
    if (oldController != null) {
      oldController.removeListener(_onControllerUpdate);
      oldController.pause();
    }
    // 重新绘制界面
    setState(() {
      // redraw
    });
    // 初始化新的播放控制器，初始化完毕后，开始播放
    controller
      ..initialize().then((value) {
      	// 旧播放控制器释放资源
        oldController?.dispose();
      	// 更新当前播放的视频索引
        _playingIndex = index;
      	// 添加播放器的监听，可以获取到当前播放进度等信息
        controller.addListener(_onControllerUpdate);
      	// 开始播放
        controller.play();
      	// 重绘界面
        setState(() {
          // redraw
        });
      });
  }
```

同时，点击之后，会展示一个播放区域的视图，在视频播放器没有初始化好时，返回一个占位的文案，初始化好后，展示 VideoPlayer 这个 Widget。

```dart
/// 播放器区域
Widget _playerView(BuildContext context) {
  final controller = _videoPlayerController;
  if (controller?.value.isInitialized == true) {
    return Container(
      height: 180,
      color: Colors.green.withOpacity(0.5),
      child:
          AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller!)),
    );
  } else {
    return Container(
      height: 180,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Center(
          child: Text(
            "Preparing...",
            style: TextStyle(
              color: AppColor.secondPageTitleColor,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
```

还有一些播放控制的细节不展开了。

另外还用到了 [GetX](https://pub.dev/packages/get) 这个非常出名的库，不过这个项目里只用它来弹了一个 SnackBar。没有用到其他的功能，后续好好在学习下这个库。

```dart
Get.snackbar(
  "Video",
  "No more videos ahead",
  snackPosition: SnackPosition.BOTTOM,
    icon: Icon(
      Icons.face,
      size: 30,
      color: Colors.white,
    ),
    backgroundColor: AppColor.gradientSecond,
    colorText: Colors.white
);
```

这两集视频教程出自 **DBestech** 这个网站中的 [Flutter 教程](https://www.dbestech.com/courses/flutter)，还有一些前置和后置的视频课程，后续可以都跟着学习一下。

这个视频播放器的代码在：[video_player_app](https://github.com/owenleexiaoyu/FlutterCodeLabs/tree/main/video_player_app) 中。