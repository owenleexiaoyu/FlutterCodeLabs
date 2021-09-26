import 'package:flutter/material.dart';
import 'package:food_ordering_app_ui/constants.dart';

class FoodCategory extends StatefulWidget {
  List<String> categories;

  FoodCategory({Key? key, required this.categories});

  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {

  int currentSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.only(top: 20),
        child: MediaQuery.removePadding(
          context: context,
          removeLeft: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i< widget.categories.length; i++)
                  _foodCategoryItem(widget.categories[i], currentSelected == i, () {
                    setState(() {
                      currentSelected = i;
                    });
                  })
              ],
            ),
          ),
        ));
  }

  Widget _foodCategoryItem(
      String title, bool isSelected, GestureTapCallback onSelected) {
    return GestureDetector(
      onTap: onSelected,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w400,
                  fontSize: 16,
                  color: isSelected ? Colors.black87 : Colors.grey),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: isSelected ? kPrimaryColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
