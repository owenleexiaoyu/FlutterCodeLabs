import 'dart:convert';

import 'package:flutter/material.dart';
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

  late VideoPlayerController _videoPlayerController;

  void _initData() async {
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
      setState(() {
        videoInfos = json.decode(value);
      });
      debugPrint(videoInfos.toString());
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
          gradient: LinearGradient(
            colors: [
              AppColor.gradientFirst.withOpacity(0.8),
              AppColor.gradientSecond.withOpacity(0.8)
            ],
            begin: Alignment.centerLeft,
            end: Alignment.topRight
          )
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 70),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      }, child: Icon(Icons.arrow_back_ios, size: 20,color: AppColor.secondPageTopIconColor,)),
                  Expanded(child: Container()),
                  Icon(Icons.info_outline, size: 20,color: AppColor.secondPageTopIconColor,),
                ],
              ),
            ),
            SizedBox(height: 30,),
            _showPlayArea == false ? _buildVideoHeader() : _buildPlayArea(context),
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
                      Text("Circuit 1: Leg Toning", style: TextStyle(
                        color: AppColor.circuitsColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      Expanded(child: Container()),
                      Icon(Icons.loop, size: 30, color: AppColor.loopColor,),
                      SizedBox(width: 10,),
                      Text("3 sets", style: TextStyle(
                        color: AppColor.setsColor,
                        fontSize: 16,
                      ),)
                    ],
                  ),
                  SizedBox(height: 30,),
                  _buildVideoList(),
                ],
              ),
            )),
          ],
        ),
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
          Text("Legs Toning", style: TextStyle(
            color: AppColor.secondPageTitleColor,
            fontSize: 25,
          ),),
          SizedBox(height: 4,),
          Text("and Glute Workout", style: TextStyle(
            color: AppColor.secondPageTitleColor,
            fontSize: 25,
          ),),
          Expanded(child: Container()),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.secondPageIconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                    children: [
                      Icon(Icons.timer, size: 20, color: AppColor.secondPageIconColor,),
                      SizedBox(width: 4,),
                      Text("68 min", style: TextStyle(
                        color: AppColor.secondPageTitleColor,
                        fontSize: 14,
                      ),)
                    ]

                ),
              ),
              SizedBox(width: 20,),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColor.secondPageIconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                    children: [
                      Icon(Icons.handyman_outlined, size: 20, color: AppColor.secondPageIconColor,),
                      SizedBox(width: 4,),
                      Text("Resistent band, Kettlebell", style: TextStyle(
                        color: AppColor.secondPageTitleColor,
                        fontSize: 14,
                      ),)
                    ]

                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  /// 播放器区域
  Widget _buildPlayArea(BuildContext context) {
    final controller = _videoPlayerController;
    if (controller.value.isInitialized) {
      return Container(
        height: 180,
        color: Colors.green.withOpacity(0.5),
        child: AspectRatio(
          aspectRatio: 16/9, child: VideoPlayer(controller)),
      );
    } else {
      return Container(
        height: 180,
        child: Center(
          child: Text("Preparing...",
          style: TextStyle(
            color: AppColor.secondPageTitleColor,
            fontSize: 20
          ),),
        ),
      );
    }
  }

  /// 视频列表
  Widget _buildVideoList() {
    return Expanded(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
            itemCount: videoInfos.length,
            itemBuilder: (_, index) {
              return _buildVideoItem(index);
            }),
      ),
    );
  }

  /// 视频列表的 Item
  Widget _buildVideoItem(int index) {
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
                        fit: BoxFit.cover
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(videoInfos[index]["title"], style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),),
                    SizedBox(height: 10,),
                    Text(videoInfos[index]["time"], style: TextStyle(
                      color: AppColor.setsColor,
                    ),),
                  ],
                )
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColor.gradientSecond.withOpacity(0.2),
                  ),
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                        color: AppColor.gradientSecond
                    ),
                  ),
                ),
                Row(
                  children: [
                    for(int i = 0; i< 32;i++)
                      Container(
                        width: 3,
                        height: 1,
                        margin: EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                            color: AppColor.gradientSecond,
                            borderRadius: BorderRadius.circular(1)
                        ),
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
    final controller = VideoPlayerController.network(videoInfos[index]["videoUrl"]);
    _videoPlayerController = controller;
    setState(() {
      // redraw
    });
    controller..initialize().then((value) {
      controller.play();
      setState(() {
        // redraw
      });
    });
  }
}
