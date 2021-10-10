import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_ordering_app_ui/pages/detail/detail_page.dart';
import 'package:food_ordering_app_ui/pages/home/components/food_card.dart';

Widget foodList(BuildContext context) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: [
        FoodCard(title: "Burger & Beer", shopName: "MacDonald's", coverPath: "assets/icons/burger_beer.svg", onCardTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage();
          }));
        },),
        FoodCard(title: "Chinese & Noodles", shopName: "Wendy's", coverPath: "assets/icons/chinese_noodles.svg"),
        FoodCard(title: "Burger & Beer", shopName: "MacDonald's", coverPath: "assets/icons/burger_beer.svg",),
        FoodCard(title: "Burger & Beer", shopName: "MacDonald's", coverPath: "assets/icons/burger_beer.svg",),
      ],
    ),
  );
}