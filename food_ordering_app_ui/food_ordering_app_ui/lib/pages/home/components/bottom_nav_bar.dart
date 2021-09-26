import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

BottomNavigationBar bottomNavBar() {
  return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/home.svg"), label: "Home"),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Following.svg"), label: "Liked"),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/Glyph.svg"), label: "Glyph"),
      BottomNavigationBarItem(icon: SvgPicture.asset("assets/icons/person.svg"), label: "Profile"),
    ],
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  );
}