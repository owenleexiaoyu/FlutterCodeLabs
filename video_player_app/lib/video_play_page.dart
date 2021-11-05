import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_app/colors.dart';

class VideoInfoPage extends StatefulWidget {
  @override
  _VideoInfoPageState createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  /// 视频数据源
  List videoInfos = [];

  /// 展示播放器区域
  bool _showPlayArea = false;

  /// 是否正在播放
  bool _isPlaying = false;

  bool _disposed = false;

  /// 正在播放的 index
  int _playingIndex = -1;

  VideoPlayerController? _videoPlayerController;

  void _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/videoinfo.json")
        .then((value) {
      setState(() {
        videoInfos = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.gradientFirst.withOpacity(0.8),
          AppColor.gradientSecond.withOpacity(0.8)
        ], begin: Alignment.centerLeft, end: Alignment.topRight)),
        child: Column(
          children: [
            _titleBar(),
            SizedBox(
              height: 30,
            ),
            _showPlayArea == false
                ? _buildVideoHeader()
                : Column(
                    children: [
                      _playerView(context),
                      _controlBar(context)
                    ],
                  ),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Circuit 1: Leg Toning",
                        style: TextStyle(
                            color: AppColor.circuitsColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.loop,
                        size: 30,
                        color: AppColor.loopColor,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "3 sets",
                        style: TextStyle(
                          color: AppColor.setsColor,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  _videoList(),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }

  /// Title bar 部分
  Widget _titleBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: AppColor.secondPageTopIconColor,
              )),
          Expanded(child: Container()),
          Icon(
            Icons.info_outline,
            size: 20,
            color: AppColor.secondPageTopIconColor,
          ),
        ],
      ),
    );
  }

  /// 视频信息头部区域
  Widget _buildVideoHeader() {
    return Container(
      height: 180,
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Legs Toning",
            style: TextStyle(
              color: AppColor.secondPageTitleColor,
              fontSize: 25,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "and Glute Workout",
            style: TextStyle(
              color: AppColor.secondPageTitleColor,
              fontSize: 25,
            ),
          ),
          Expanded(child: Container()),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.secondPageIconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(children: [
                  Icon(
                    Icons.timer,
                    size: 20,
                    color: AppColor.secondPageIconColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "68 min",
                    style: TextStyle(
                      color: AppColor.secondPageTitleColor,
                      fontSize: 14,
                    ),
                  )
                ]),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.secondPageIconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(children: [
                  Icon(
                    Icons.handyman_outlined,
                    size: 20,
                    color: AppColor.secondPageIconColor,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    "Resistent band, Kettlebell",
                    style: TextStyle(
                      color: AppColor.secondPageTitleColor,
                      fontSize: 14,
                    ),
                  )
                ]),
              ),
            ],
          )
        ],
      ),
    );
  }

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

  String formatDuration(int value) {
    return value < 10 ? "0$value" : "$value";
  }

  /// 播放控制栏
  Widget _controlBar(BuildContext context) {
    final isMute = (_videoPlayerController?.value.volume ?? 0) <= 0;
    final duration = _duration?.inSeconds ?? 0;
    debugPrint("duration = $_duration");
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);  // 还没有播的时长
    final mins = formatDuration(remained ~/ 60);
    final secs = formatDuration(remained % 60);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Column(
        children: [
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Colors.red[700],
              inactiveTrackColor: Colors.red[100],
              trackHeight: 3.0,
              thumbColor: Colors.redAccent,
            ),
            child: Slider(value: max(0, min(_progress * 100, 100)),
                min: 0,
                max: 100,
                divisions: 100,
                label: _position?.toString().split(".")[0],
                onChanged: (value) {
                  setState(() {
                    _progress = value * 0.01;
                  });
                },
            onChangeStart: (value) {
              _videoPlayerController?.pause();
            },
            onChangeEnd: (value) {
              final duration = _duration;
              if (duration != null) {
                var newPosition = (max(0, min(value, 99)) * 0.01 * duration.inMilliseconds).toInt();
                _videoPlayerController?.seekTo(Duration(milliseconds: newPosition));
                _videoPlayerController?.play();
              }
            },),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    if (isMute) {
                      _videoPlayerController?.setVolume(1);
                    } else {
                      _videoPlayerController?.setVolume(0);
                    }
                  });
                },
                child: Icon(
                  isMute ? Icons.volume_off : Icons.volume_up,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () {
                  final index = _playingIndex - 1;
                  if (index >= 0 && videoInfos.length >= 0) {
                    _initializeVideo(index);
                  } else {
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
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _videoPlayerController?.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _videoPlayerController?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              TextButton(
                onPressed: () {
                  final index = _playingIndex + 1;
                  if (index < videoInfos.length) {
                    _initializeVideo(index);
                  } else {
                    Get.snackbar(
                      "Video",
                      "You have finished watching all videos!",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(
                        Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: AppColor.gradientSecond,
                      colorText: Colors.white
                    );
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                  size: 36,
                ),
              ),
              Text("$mins:$secs", style: TextStyle(
                color: Colors.white
              ),)
            ],
          ),
        ],
      ),
    );
  }

  /// 视频列表
  Widget _videoList() {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: videoInfos.length,
            itemBuilder: (_, index) {
              return _videoListItem(index);
            }),
      ),
    );
  }

  /// 视频列表的 Item
  Widget _videoListItem(int index) {
    return GestureDetector(
      onTap: () {
        debugPrint(index.toString());
        _onTapVideoItem(index);
        setState(() {
          if (_showPlayArea == false) {
            _showPlayArea = true;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(videoInfos[index]["thumbnail"]),
                        fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoInfos[index]["title"],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      videoInfos[index]["time"],
                      style: TextStyle(
                        color: AppColor.setsColor,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.gradientSecond.withOpacity(0.2),
                  ),
                  child: Text(
                    "15s rest",
                    style: TextStyle(color: AppColor.gradientSecond),
                  ),
                ),
                Row(
                  children: [
                    for (int i = 0; i < 20; i++)
                      Container(
                        width: 3,
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: AppColor.gradientSecond,
                            borderRadius: BorderRadius.circular(1)),
                      )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTapVideoItem(int index) {
    _initializeVideo(index);
  }

  void _initializeVideo(int index) async {
    final controller =
        VideoPlayerController.network(videoInfos[index]["videoUrl"]);
    final oldController = _videoPlayerController;
    _videoPlayerController = controller;
    if (oldController != null) {
      oldController.removeListener(_onControllerUpdate);
      oldController.pause();
    }
    setState(() {
      // redraw
    });
    controller
      ..initialize().then((value) {
        oldController?.dispose();
        _playingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {
          // redraw
        });
      });
  }
  var _onUpdateControllerTime = 0;

  Duration? _duration; // 视频的总时长
  Duration? _position; // 已播放的时长
  var _progress = 0.0; // 已播放时长占总时长的比例

  void _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    /// 频控，500ms内直接返回，防止频繁触发重绘
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;

    final controller = _videoPlayerController;
    if (controller == null) {
      debugPrint("controller is null");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller is not initialized");
      return;
    }
    /// 从播放器回调中获取总时长和已播放时长信息
    if (_duration == null) {
      _duration = controller.value.duration;
    }
    if (_duration == null) {
      return;
    }
    _position = await controller.position;

    final playing = controller.value.isPlaying;
    _isPlaying = playing;
    if (playing && !_disposed) {
      setState(() {
        _progress = _position!.inMilliseconds.ceilToDouble() / _duration!.inMilliseconds.ceilToDouble();
      });
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _videoPlayerController?.pause();
    _videoPlayerController?.dispose();
    _videoPlayerController = null;
    super.dispose();
  }
}
