import 'package:flutter/material.dart';
import 'package:video_player_app/colors.dart';

class VideoInfoPage extends StatelessWidget {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                height: 220,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          }, child: Icon(Icons.arrow_back_ios, size: 20,color: AppColor.secondPageTopIconColor,)),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline, size: 20,color: AppColor.secondPageTopIconColor,),
                      ],
                    ),
                    SizedBox(height: 30,),
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
                    
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
