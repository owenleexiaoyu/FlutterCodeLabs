import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class DestinationCarousel extends StatefulWidget {
  const DestinationCarousel({Key? key}) : super(key: key);

  @override
  _DestinationCarouselState createState() => _DestinationCarouselState();
}

class _DestinationCarouselState extends State<DestinationCarousel> {
  final CarouselController _controller = CarouselController();

  int _currentIndex = 0;

  final List<CarouselItem> items = [
    CarouselItem('assets/images/asia.jpg', 'ASIA'),
    CarouselItem('assets/images/africa.jpg', 'AFRICA'),
    CarouselItem('assets/images/europe.jpg', 'EUROPE'),
    CarouselItem('assets/images/south_america.jpg', 'SOUTH AMERICA'),
    CarouselItem('assets/images/australia.jpg', 'AUSTRALIA'),
    CarouselItem('assets/images/antarctica.jpg', 'ANTARCTICA')
  ];

  List<Widget> generateImageTiles() {
    return items
        .map((e) => ClipRRect(
              child: Image.asset(
                e.image,
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15),
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 100),
      color: Colors.white,
      child: Stack(
        children: [
          CarouselSlider(
            items: generateImageTiles(),
            options: CarouselOptions(enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, _){
              setState(() {
                _currentIndex = index;
              });
            }),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Center(
              child: Text(
                items[_currentIndex].title,
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontSize: MediaQuery.of(context).size.width / 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CarouselItem {
  final String image;
  final String title;

  const CarouselItem(this.image, this.title);
}
