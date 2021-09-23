import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:video_player_app/colors.dart';
import 'package:video_player_app/video_info.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List info = [];

  void _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = json.decode(value);
      print(info);
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
      backgroundColor: AppColor.homePageBackground,
      body: Container(
        padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Training",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppColor.homePageTitle,
                  ),
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.calendar_today,
                  size: 20,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "Your program",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColor.homePageSubtitle,
                  ),
                ),
                Expanded(child: Container()),
                Text(
                  "Details",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: AppColor.homePageDetail,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return VideoInfoPage();
                    }));
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    size: 20,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                height: 220,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColor.gradientFirst.withOpacity(0.8),
                        AppColor.gradientSecond.withOpacity(0.8)
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gradientSecond.withOpacity(0.2),
                        offset: Offset(10, 10),
                        blurRadius: 20,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(80),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next workout",
                        style: TextStyle(
                          color: AppColor.homePageContainerTextSmall,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                            color: AppColor.homePageContainerTextBig,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "and Glutes Workout",
                        style: TextStyle(
                            color: AppColor.homePageContainerTextBig,
                            fontSize: 25),
                      ),
                      Expanded(child: Container()),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.timer,
                            size: 20,
                            color: AppColor.homePageContainerTextBig,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "60 min",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColor.homePageContainerTextBig),
                          ),
                          Expanded(child: Container()),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.gradientFirst,
                                      blurRadius: 10,
                                      offset: Offset(4, 8),
                                    )
                                  ]),
                              child: Icon(
                                Icons.play_circle_fill,
                                size: 60,
                                color: AppColor.homePageContainerTextBig,
                              ))
                        ],
                      )
                    ],
                  ),
                )),
            Container(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    height: 120,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/card.jpg"),
                          fit: BoxFit.fill,
                        ),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 40,
                            color: AppColor.gradientSecond.withOpacity(0.3),
                            offset: Offset(8, 10),
                          ),
                          BoxShadow(
                            blurRadius: 10,
                            color: AppColor.gradientSecond.withOpacity(0.3),
                            offset: Offset(-1, -5),
                          )
                        ]),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/figure.png"),
                    )),
                  ),
                  Container(
                    height: 100,
                    margin: const EdgeInsets.only(left: 150, top: 50),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great",
                            style: TextStyle(
                              color: AppColor.homePageDetail,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10,),
                          RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style: TextStyle(
                                  color: AppColor.homePagePlanColor,
                                  fontSize: 16,
                                ),
                            children: [
                              TextSpan(
                                text: "stick to your plan"
                              )
                            ]),
                          )
                        ]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text("Area of focus",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColor.homePageTitle,
                ),),
              ],
            ),
            Expanded(
              child: MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  children: info.map((e) => Container(
                    width: 100,
                    height: 200,
                    padding: const EdgeInsets.only(bottom: 10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage(
                          e["img"]
                        )
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(3, 3),
                        ),
                        BoxShadow(
                          color: AppColor.gradientSecond.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(-3, -3),
                        )
                      ]
                    ),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        e["title"],
                        style: TextStyle(
                          color: AppColor.homePageDetail,
                          fontWeight: FontWeight.w500,
                          fontSize: 20
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
