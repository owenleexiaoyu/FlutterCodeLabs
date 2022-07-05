import 'package:flutter/material.dart';

class ReliefBox extends StatelessWidget {

  const ReliefBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // darker shadow on the bottom right
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                offset: Offset(5, 5)
            ),
            // lighter shadow on the top left
            BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                offset: Offset(-5, -5)
            ),
          ]
      ),
      child: child,
    );
  }
}
