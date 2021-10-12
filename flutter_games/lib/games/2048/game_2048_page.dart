import 'package:flutter/material.dart';
import 'package:flutter_games/games/2048/game_2048_panel.dart';
import 'package:flutter_games/games/2048/game_colors.dart';

class Game2048Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(top: 70),
        color: GameColors.bgColor1,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2048",
                          style: TextStyle(
                              color: GameColors.textColor1,
                              fontSize: 56,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Play 2048 Game Now",
                          style: TextStyle(
                            fontSize: 14,
                            color: GameColors.textColor1,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Join numbers and get to the 2048 tile!",
                          style: TextStyle(color: GameColors.textColor1),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 100,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: GameColors.bgColor2,
                          ),
                          child: Column(
                            children: [
                              Text(
                                "SCORE",
                                style: TextStyle(
                                  color: GameColors.textColor2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                "0",
                                style: TextStyle(
                                    color: GameColors.textColor3,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: GameColors.bgColor3,
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {},
                              child: Text(
                                "NEW GAME",
                                style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Game2048Panel(),
          ],
        ),
      ),
    );
  }
}
