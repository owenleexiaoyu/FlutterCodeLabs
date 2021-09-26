import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app_ui/constants.dart';

AppBar homeAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(icon: SvgPicture.asset("assets/icons/menu.svg"), onPressed: () {},),
    title: Text.rich(TextSpan(
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        children: [
          TextSpan(
            text: "Punk",
            style: TextStyle(
                color: kPrimaryColor
            ),
          ),
          TextSpan(
            text: "Food",
            style: TextStyle(
                color: kSecondaryColor
            ),
          ),
        ]
    )),
    actions: [
      IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/notification.svg")),
    ],
  );
}