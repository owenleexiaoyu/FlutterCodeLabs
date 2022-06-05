import 'dart:math';

import 'package:flutter/material.dart';

/**
 * 将子组件裁剪成一个五角星
 */
class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var width = size.width;
    var height = size.height;
    var borderLength = min(width, height);
    var top = (height - borderLength) / 2;
    var left = (width - borderLength) / 2;
    var centerX = width / 2;

    Path starPath = Path();
    starPath.moveTo(centerX, top);
    starPath.lineTo(left + borderLength * 0.65, top + borderLength * 0.4);
    starPath.lineTo(left + borderLength, top + borderLength * 0.4);
    starPath.lineTo(left + borderLength * 0.72, top + borderLength * 0.6);
    starPath.lineTo(left + borderLength * 0.85, top + borderLength);
    starPath.lineTo(centerX, top + borderLength * 0.75);
    starPath.lineTo(left + borderLength * 0.15, top + borderLength);
    starPath.lineTo(left + borderLength * 0.28, top + borderLength * 0.6);
    starPath.lineTo(left, top + borderLength * 0.4);
    starPath.lineTo(left + borderLength * 0.35, top + borderLength * 0.4);
    starPath.lineTo(centerX, top);
    starPath.close();
    return starPath;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}