
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app_ui/constants.dart';

Widget discountCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 15,),
      Text("Offers & Discounts",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),),
      Container(
        margin: EdgeInsets.only(top: 15),
        width: double.infinity,
        height: 170,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: AssetImage("assets/images/beyond-meat-mcdonalds.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            children: [
              Expanded(child: SvgPicture.asset("assets/icons/macdonalds.svg")),
              Expanded(child: Text.rich(TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                        text: "Get Discount of\n",
                        style: TextStyle(
                          fontSize: 16,
                        )
                    ),
                    TextSpan(
                        text: "30%\n",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        )
                    ),
                    TextSpan(
                        text: "at MacDonald's on your first order & Instant cashback",
                        style: TextStyle(
                          fontSize: 10,
                        )
                    ),
                  ]
              )))
            ],
          ),
        ),
      )
    ],
  );
}