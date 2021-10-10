import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_ordering_app_ui/constants.dart';

class SearchBox extends StatelessWidget {

  final ValueChanged<String> onChanged;

  const SearchBox({
    Key? key,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        border: Border.all(color: kSecondaryColor.withOpacity(0.32)),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon: SvgPicture.asset("assets/icons/search.svg"),
            hintText: "Search here",
            hintStyle: TextStyle(color: kSecondaryColor)
        ),
      ),
    );
  }
}
