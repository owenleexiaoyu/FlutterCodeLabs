import 'package:flutter/material.dart';
import 'package:flutter_games/games/2048/game_colors.dart';

class Game2048Panel extends StatefulWidget {
  @override
  _Game2048PanelState createState() => _Game2048PanelState();
}

class _Game2048PanelState extends State<Game2048Panel> {
  /// 当上下滑动时，左右方向的偏移应该小于这个阈值，左右滑动亦然
  double _crossAxisMaxLimit = 20.0;

  /// 当上下滑动时，上下方向的偏移应该大于这个阈值，左右滑动亦然
  double _mainAxisMinLimit = 80.0;

  /// onPanUpdate 会回调多次，只需要第一次有效的就可以了，
  /// 在 onPanDown 时设为 true，第一次有效滑动后，设为 false
  bool _firstValidPan = true;

  List gameMap = List.generate(4, (_) => List.generate(4, (_) => 0));

  @override
  void initState() {
    super.initState();

    initGameMap();
  }

  /// 初始化数据
  void initGameMap() {
    // gameMap[0][0] = 2;
    // gameMap[0][1] = 4;
    // gameMap[0][2] = 8;
    // gameMap[0][3] = 16;
    // gameMap[1][0] = 32;
    // gameMap[1][1] = 64;
    // gameMap[1][2] = 128;
    // gameMap[1][3] = 256;

    gameMap[0][0] = 0;
    gameMap[0][1] = 2;
    gameMap[0][2] = 2;
    gameMap[0][3] = 4;
  }

  /// 根据传入的手势滑动的方向，重新计算 gameMap 数据源
  void calculateGameMap(PanDirection direction) {
    switch(direction) {
      case PanDirection.LEFT:
        joinGameMapDataToLeft();
        break;
      case PanDirection.RIGHT:
        joinGameMapDataToRight();
        break;
      case PanDirection.TOP:
        joinGameMapDataToTop();
        break;
      case PanDirection.BOTTOM:
        joinGameMapDataToBottom();
        break;
      default:
        break;
    }
  }

  void joinGameMapDataToLeft() {
    for (int i = 0; i < 4; i++) {
      int j1 = 0;
      while(j1 < 3) {
        if (gameMap[i][j1] == 0) {
          j1++;
          continue;
        }
        for (int j2 = j1+1;j2 < 4; j2++) {
          if (gameMap[i][j2] == 0) {
            continue;
          }
          if (gameMap[i][j1] == gameMap[i][j2]) {
            gameMap[i][j1] = 2 * gameMap[i][j1];
            gameMap[i][j2] = 0;
            j1 = j2;
          }
        }
      }
      int notZeroCount = 0;
      for (int k = 0;k < 4;k++) {
        if (gameMap[i][k] != 0) {
          if (k != notZeroCount) {
            gameMap[i][notZeroCount] = gameMap[i][k];
            gameMap[i][k] = 0;
          }
          notZeroCount++;
        }
      }
    }
  }

  void joinGameMapDataToRight() {
    for (int i = 0; i < 4; i++) {
      int j1 = 3;
      while(j1 > 0) {
        if (gameMap[i][j1] == 0) {
          j1--;
          continue;
        }
        for (int j2 = j1-1;j2 >= 0; j2--) {
          if (gameMap[i][j2] == 0) {
            continue;
          }
          if (gameMap[i][j1] == gameMap[i][j2]) {
            gameMap[i][j1] = 2 * gameMap[i][j1];
            gameMap[i][j2] = 0;
            j1 = j2;
          }
        }
      }
      int notZeroCount = 0;
      for (int k = 3;k >= 0;k--) {
        if (gameMap[i][k] != 0) {
          if (k != (3 - notZeroCount)) {
            gameMap[i][3 - notZeroCount] = gameMap[i][k];
            gameMap[i][k] = 0;
          }
          notZeroCount++;
        }
      }
    }
  }

  void joinGameMapDataToTop() {}

  void joinGameMapDataToBottom() {}
  @override
  Widget build(BuildContext context) {
    Offset lastPosition = Offset.zero;
    return GestureDetector(
      onPanDown: (DragDownDetails details) {
        lastPosition = details.globalPosition;
        _firstValidPan = true;
      },
      onPanUpdate: (DragUpdateDetails details) {
        final currentPosition = details.globalPosition;

        /// 首先区分是垂直方向还是水平方向滑动
        if ((currentPosition.dx - lastPosition.dx).abs() > _mainAxisMinLimit &&
            (currentPosition.dy - lastPosition.dy).abs() < _crossAxisMaxLimit) {
          // 水平方向滑动
          if (_firstValidPan) {
            debugPrint("水平方向滑动");

            /// 然后区分是向左滑还是向右滑
            if (currentPosition.dx - lastPosition.dx > 0) {
              // 向右滑
              debugPrint("向右滑");
              setState(() {
                calculateGameMap(PanDirection.RIGHT);
              });
            } else {
              // 向左滑
              debugPrint("向左滑");
              setState(() {
                calculateGameMap(PanDirection.LEFT);
              });
            }
            _firstValidPan = false;
          }
        } else if ((currentPosition.dy - lastPosition.dy).abs() > _mainAxisMinLimit &&
            (currentPosition.dx - lastPosition.dx).abs() < _crossAxisMaxLimit) {
          // 垂直方向滑动
          if (_firstValidPan) {
            debugPrint("垂直方向滑动");

            /// 然后区分是向上滑还是向下滑
            if (currentPosition.dy - lastPosition.dy > 0) {
              // 向下滑
              debugPrint("向下滑");
              setState(() {
                calculateGameMap(PanDirection.BOTTOM);
              });
            } else {
              // 向上滑
              debugPrint("向上滑");
              setState(() {
                calculateGameMap(PanDirection.TOP);
              });
            }
            _firstValidPan = false;
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: GameColors.bgColor2,
            borderRadius: BorderRadius.circular(10),
          ),
          child: MediaQuery.removePadding(
            removeTop: true,

            /// GridView 默认顶部会有 padding，通过这个删除顶部 padding
            context: context,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),

              /// 禁用 GridView 的滑动
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 16,
              itemBuilder: (context, int index) {
                int indexI = index ~/ 4;
                int indexJ = index % 4;
                return _buildGameCell(gameMap[indexI][indexJ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGameCell(int value) {
    return Container(
      decoration: BoxDecoration(
        color: GameColors.mapValueToColor(value),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          value == 0 ? "" : value.toString(),
          style: TextStyle(
            color:
                value == 2 || value == 4 ? GameColors.textColor1 : Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}

/// 手势滑动的四个方向
enum PanDirection { TOP, BOTTOM, LEFT, RIGHT }
