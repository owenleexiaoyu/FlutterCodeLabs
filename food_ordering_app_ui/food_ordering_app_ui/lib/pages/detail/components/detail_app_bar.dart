import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar detailAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        )),
    actions: [
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/share.svg")),
      IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/more.svg")),
    ],
  );
}