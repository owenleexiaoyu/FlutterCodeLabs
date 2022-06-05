import 'package:flutter/material.dart';

/**
 * 圆形头像组件
 */
class RoundAvatarWidget extends StatelessWidget {

  final double size;         // 宽高尺寸
  final Widget child;        // 子组件
  final double borderWidth;  // 边框宽度
  final Color borderColor;   // 边框颜色

  const RoundAvatarWidget(
      {Key? key,
      required this.size,
      required this.child,
      this.borderWidth = 0.0,
      this.borderColor = Colors.black})
      : assert(size > 0),
        assert(borderWidth > 0),
        assert(borderWidth < size / 2),
        super(key: key);

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
