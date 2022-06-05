import 'package:flutter/material.dart';

class CustomRectClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    // 裁剪距 Left 10，距Top 15，宽度为 40，高度为 30 的矩形范围
    return Rect.fromLTWH(10.0, 15.0, 40, 30);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}