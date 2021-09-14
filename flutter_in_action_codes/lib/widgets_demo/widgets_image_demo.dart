import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("images/chandler2.jpg");
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
              children: <Image>[
            Image(
              image: img,
              width: 100,
            ),
            Image.asset(
              "images/chandler2.jpg",
              width: 150,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 100,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 150,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fill,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.contain,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.cover,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fitWidth,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.fitHeight,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.scaleDown,
            ),
            Image(
              image: img,
              height: 50,
              width: 100,
              fit: BoxFit.none,
            ),
                Image(
                  image: img,
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.difference,
                ),
                Image(
                  image: img,
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.color,
                ),
                Image(
                  image: img,
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.clear,
                ),
                Image(
                  image: img,
                  height: 100,
                  width: 100,
                  color: Colors.blue,
                  colorBlendMode: BlendMode.colorBurn,
                ),
                Image(
                  image: img,
                  height: 300,
                  width: 100,
                  repeat: ImageRepeat.noRepeat,
                ),
                Image(
                  image: img,
                  height: 300,
                  width: 100,
                  repeat: ImageRepeat.repeat,
                ),
                Image(
                  image: img,
                  height: 300,
                  width: 100,
                  repeat: ImageRepeat.repeatX,
                ),
                Image(
                  image: img,
                  height: 300,
                  width: 100,
                  repeat: ImageRepeat.repeatY,
                ),
          ].map((e) {
            return Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    child: SizedBox(
                      width: 100,
                      child: e,
                    ),
                    decoration: BoxDecoration(color: Colors.yellow),
                  ),
                ),
                Text(e.fit.toString())
              ],
            );
          }).toList()),
        ),
      ),
    );
  }
}
