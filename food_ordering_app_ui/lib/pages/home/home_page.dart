import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/pages/home/components/bottom_nav_bar.dart';
import 'package:food_ordering_app_ui/pages/home/components/discount_card.dart';
import 'package:food_ordering_app_ui/pages/home/components/food_category.dart';
import 'package:food_ordering_app_ui/pages/home/components/food_list.dart';
import 'package:food_ordering_app_ui/pages/home/components/home_app_bar.dart';
import 'package:food_ordering_app_ui/pages/home/components/search_box.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: homeAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchBox(onChanged: (value) {

              },),
              FoodCategory(categories: [
                "Combo Meal",
                "Chicken",
                "Beverages",
                "Snacks"
              ]),
              foodList(context),
              discountCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
