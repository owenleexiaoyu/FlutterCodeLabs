import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app_ui/constants.dart';

Container orderButton() {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
    width: double.infinity,
    child: ElevatedButton.icon(onPressed: () {},
      icon: SvgPicture.asset("assets/icons/bag.svg"),
      label: Text("Order Now",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(kPrimaryColor),
        elevation: MaterialStateProperty.all<double>(0),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 20)),
      ),
    ),
  );
}