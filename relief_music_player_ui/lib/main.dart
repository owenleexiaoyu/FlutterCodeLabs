import 'package:flutter/material.dart';
import 'package:relief_music_player_ui/relief_box.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Relief Music Player UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MusicPlayerPage(),
    );
  }
}

class MusicPlayerPage extends StatelessWidget {

  MusicPlayerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ReliefBox(
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text("P L A Y L I S T", style: TextStyle(fontSize: 16),),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ReliefBox(
                      child: Icon(Icons.menu),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              ReliefBox(child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset("images/cover.webp",
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("夏日漱石", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          SizedBox(height: 4,),
                          Text("橘子海", style: TextStyle(fontSize: 14, color: Colors.grey),),
                        ],
                      ),
                      Icon(Icons.favorite, color: Colors.redAccent, size: 32,),
                    ],
                  )
                ],
              ),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("00:00"),
                  Icon(Icons.shuffle),
                  Icon(Icons.repeat),
                  Text("04:23"),
                ],
              ),
              SizedBox(height: 30,),
              ReliefBox(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  color: Colors.green,
                  value: 0.7,
                  minHeight: 5,
                ),
              ),
              SizedBox(height: 30,),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 80,
                        child: ReliefBox(
                            child: Icon(
                          Icons.skip_previous,
                          size: 32,
                        )),
                      )),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: SizedBox(
                          height: 80,
                          child: ReliefBox(
                              child: Icon(
                            Icons.play_arrow,
                            size: 40,
                          )),
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 80,
                        child: ReliefBox(
                            child: Icon(
                          Icons.skip_next,
                          size: 32,
                        )),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
