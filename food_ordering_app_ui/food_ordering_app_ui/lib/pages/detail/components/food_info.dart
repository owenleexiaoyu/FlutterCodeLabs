
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_ordering_app_ui/constants.dart';
import 'package:food_ordering_app_ui/pages/detail/components/price_tag.dart';

Widget foodInfo() {
  return Column(
    children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Icon(Icons.location_pin, size: 20,color: kTextLightColor,),
          SizedBox(width: 10,),
          Text("MacDonald's",style: TextStyle(
              color: kTextLightColor
          ),)
        ],
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Text("Cheese Burger", style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kTextColor
              ),),
              SizedBox(height: 10,),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 4.0,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) {
                      return Icon(Icons.star, color: kPrimaryColor,);
                    },
                    onRatingUpdate: (rating) {

                    },
                    itemSize: 20,
                    itemPadding: EdgeInsets.only(right: 5),
                    glow: false,
                  ),
                  SizedBox(width: 10,),
                  Text("24 reviewers", style: TextStyle(
                      color: kTextLightColor,
                      fontSize: 16
                  ),)
                ],
              ),
            ],
          ),
          Expanded(child: Container()),
          PriceTag(price: "\$15"),
        ],
      ),
      SizedBox(height: 20,),
      Text(
        "Nowadays, making printed materials have become fast, easy "
            "and simple. If you want your promotional material to "
            "be an eye-catching object, you should make it colored. "
            "By way of using inkjet printer this is not hard to make. "
            "An inkjet printer is any printer that places extremely "
            "small droplets of ink onto paper to create an image.",
        style: TextStyle(
          color: kTextLightColor,
          height: 1.5,
          fontSize: 16,
        ),
        textAlign: TextAlign.justify,
      ),
    ],
  );
}