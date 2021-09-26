import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app_ui/constants.dart';

class FoodCard extends StatelessWidget {
  String title;
  String shopName;
  String coverPath;
  GestureTapCallback? onCardTap;

  FoodCard(
      {Key? key,
      required this.title,
      required this.shopName,
      required this.coverPath,
      this.onCardTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCardTap,
      child: Container(
        width: 150,
        height: 200,
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: kSecondaryColor.withOpacity(0.5),
                  offset: Offset(3, 3),
                  blurRadius: 5)
            ]),
        child: Center(
          child: Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.13),
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(20),
                  child: SvgPicture.asset(
                    coverPath,
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                shopName,
                style: TextStyle(
                  color: kTextLightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
