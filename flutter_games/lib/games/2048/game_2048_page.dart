import 'package:flutter/material.dart';
import 'package:flutter_games/games/2048/game_2048_panel.dart';
import 'package:flutter_games/games/2048/game_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Game2048Page extends StatefulWidget {
  @override
  _Game2048PageState createState() => _Game2048PageState();
}

class _Game2048PageState extends State<Game2048Page> {

  /// 当前分数
  int currentScore = 0;
  /// 历史最高分
  int highestScore = 0;

  static const GAME_2048_HIGHEST_SCORE = "game_2048_highest_score";

  Future<SharedPreferences> _spFuture = SharedPreferences.getInstance();

  /// 用于获取 Game2048PanelState 实例，以便可以调用restartGame方法
  GlobalKey _gamePanelKey = GlobalKey<Game2048PanelState>();

  @override
  void initState() {
    super.initState();
    readHighestScoreFromSp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        padding: EdgeInsets.only(top: 70),
        color: GameColors.bgColor1,
        child: Column(
          children: [
            gameHeader(),
            Game2048Panel(
              key: _gamePanelKey,
              onScoreChanged: (score) {
              setState(() {
                currentScore = score;
                if (currentScore > highestScore) {
                  highestScore = currentScore;
                  storeHighestScoreToSp();
                }
              });
            },),
          ],
        ),
      ),
    );
  }

  Widget gameHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                        currentScore.toString(),
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
                  padding: EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: GameColors.bgColor2,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "HIGHEST",
                        style: TextStyle(
                          color: GameColors.textColor2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2,),
                      Text(
                        highestScore.toString(),
                        style: TextStyle(
                            color: GameColors.textColor3,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: GameColors.bgColor3,
                  ),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        (_gamePanelKey.currentState as Game2048PanelState).reStartGame();
                      },
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
    );
  }

  void readHighestScoreFromSp() async {
    final SharedPreferences sp = await _spFuture;
    setState(() {
      highestScore = sp.getInt(GAME_2048_HIGHEST_SCORE) ?? 0;
    });
  }

  void storeHighestScoreToSp() async {
    final SharedPreferences sp = await _spFuture;
    await sp.setInt(GAME_2048_HIGHEST_SCORE, highestScore);
  }
}
