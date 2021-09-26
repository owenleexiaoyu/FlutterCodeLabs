import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/constants.dart';

class PriceTag extends StatelessWidget {

  final String price;
  const PriceTag({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _PriceClipper(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: kPrimaryColor,
        ),
        child: Text(
          price,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _PriceClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    debugPrint("${size.width} ${size.height}");
    double ignoreHeight = 20;
    return Path()
      ..lineTo(0, size.height - ignoreHeight)
      ..lineTo(size.width / 2, size.height)
      ..lineTo(size.width, size.height - ignoreHeight)
      ..lineTo(size.width, 0)
      ..close();
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
