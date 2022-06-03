import 'package:flutter/material.dart';

/**
 * 圆形头像组件
 */
class RoundAvatarWidget extends StatelessWidget {

  final double size;
  final Widget child;
  final double borderWidth;
  final Color borderColor;

  const RoundAvatarWidget({Key? key,
    required this.size,
    required this.child,
    this.borderWidth = 0.0,
    this.borderColor = Colors.black
  }) : assert(borderWidth < size / 2), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: borderColor,
        shape: BoxShape.circle
      ),
      child: Padding(
        padding: EdgeInsets.all(borderWidth),
        child: ClipOval(
          child: child,
        ),
      ),
    );
  }
}
