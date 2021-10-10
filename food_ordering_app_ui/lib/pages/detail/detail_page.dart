import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/constants.dart';
import 'package:food_ordering_app_ui/pages/detail/components/detail_app_bar.dart';
import 'package:food_ordering_app_ui/pages/detail/components/food_info.dart';
import 'package:food_ordering_app_ui/pages/detail/components/order_button.dart';


class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailAppBar(context),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              child: Image.asset(
                "assets/images/burger.png",
                fit: BoxFit.fitWidth,
              )),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 20, left: 30, right: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  foodInfo(),
                  Expanded(child: Container(),),
                  orderButton()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
