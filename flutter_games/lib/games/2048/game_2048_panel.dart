import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_games/games/2048/game_colors.dart';

class Game2048Panel extends StatefulWidget {

  final ValueChanged<int>? onScoreChanged;

  Game2048Panel({Key? key, this.onScoreChanged}): super(key: key);

  @override
  Game2048PanelState createState() => Game2048PanelState();
}

class Game2048PanelState extends State<Game2048Panel> {
  /// 当上下滑动时，左右方向的偏移应该小于这个阈值，左右滑动亦然
  double _crossAxisMaxLimit = 20.0;

  /// 当上下滑动时，上下方向的偏移应该大于这个阈值，左右滑动亦然
  double _mainAxisMinLimit = 60.0;

  /// onPanUpdate 会回调多次，只需要第一次有效的就可以了，
  /// 在 onPanDown 时设为 true，第一次有效滑动后，设为 false
  bool _firstValidPan = true;

  List _gameMap = List.generate(4, (_) => List<int>.generate(4, (_) => 0));

  /// 当前得分，当两个块合并时，会在当前分数的基础上增加合并后的数字
  int _currentScore = 0;

  /// 这一次手势滑动，是不是没有块移动，如果没有块移动，就不能产生新的块
  bool _noMoveInSwipe = true;

  void reStartGame() {
    setState(() {
      _resetGameMap();
      _initGameMap();
      // 清空分数
      _currentScore = 0;
      widget.onScoreChanged?.call(_currentScore);
    });
  }

  @override
  void initState() {
    super.initState();
    _initGameMap();
  }

  /// 初始化数据
  void _initGameMap() {
    /// 执行两次随机
    _randomNewCellData(2);
    _randomNewCellData(4);
  }

  void _resetGameMap() {
    for (int i = 0; i < 4; i++) {
      for (int j = 0;j < 4; j++) {
        _gameMap[i][j] = 0;
      }
    }
  }

  /// 在 gameMap 里随机位置放置指定的数字，
  /// 需要刷新界面时，需要将这个函数放在 setState 里
  void _randomNewCellData(int data) {
    /// 在产生新的数字（块）时，
    /// 需要先判断下是否map中所有的数字都不为0
    /// 如果都不为0，就直接return，不产生新数字
    bool isAllNotZero = true;
    for (int i = 0; i < 4; i++) {
      for (int j = 0; j < 4; j++) {
        if (_gameMap[i][j] == 0) {
          isAllNotZero = false;
          break;
        }
      }
    }
    if (isAllNotZero) {
      debugPrint("gameMap中都不是0，不能生成");
      return;
    }
    while(true) {
      Random random = Random();
      int randomI = random.nextInt(4);
      int randomJ = random.nextInt(4);
      if (_gameMap[randomI][randomJ] == 0) {
        _gameMap[randomI][randomJ] = data;
        break;
      }
    }
  }

  /// 根据传入的手势滑动的方向，重新计算 gameMap 数据源
  void _calculateGameMap(PanDirection direction) {
    switch(direction) {
      case PanDirection.LEFT:
        _joinGameMapDataToLeft();
        break;
      case PanDirection.RIGHT:
        _joinGameMapDataToRight();
        break;
      case PanDirection.TOP:
        _joinGameMapDataToTop();
        break;
      case PanDirection.BOTTOM:
        _joinGameMapDataToBottom();
        break;
      default:
        break;
    }
  }

  void _joinGameMapDataToLeft() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;
    for (int i = 0; i < 4; i++) {
      int j1 = 0;
      while(j1 < 3) {
        if (_gameMap[i][j1] == 0) {
          j1++;
          continue;
        }
        for (int j2 = j1+1;j2 < 4; j2++) {
          if (_gameMap[i][j2] == 0) {
            continue;
          } else if (_gameMap[i][j2] != _gameMap[i][j1]) {
            break;
          } else {
            _gameMap[i][j1] = 2 * _gameMap[i][j1];
            _gameMap[i][j2] = 0;
            /// 在这里有两个块的合并，增加分数
            _currentScore += (_gameMap[i][j1] as int);
            /// 把分数回调给外界
            widget.onScoreChanged?.call(_currentScore);
            /// 这行要写在记录score之后，不然gameMap[i][j1]实际是gameMap[i][j2]，就是0了
            j1 = j2;
            /// 有块的合并，说明有移动
            _noMoveInSwipe =false;
          }
        }
        j1++;
      }
      int notZeroCount = 0;
      for (int k = 0;k < 4;k++) {
        if (_gameMap[i][k] != 0) {
          if (k != notZeroCount) {
            _gameMap[i][notZeroCount] = _gameMap[i][k];
            _gameMap[i][k] = 0;
            /// 有非0数字和0交换，说明有移动
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
  }

  void _joinGameMapDataToRight() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;
    for (int i = 0; i < 4; i++) {
      int j1 = 3;
      while(j1 > 0) {
        if (_gameMap[i][j1] == 0) {
          j1--;
          continue;
        }
        for (int j2 = j1-1;j2 >= 0; j2--) {
          if (_gameMap[i][j2] == 0) {
            continue;
          } else if (_gameMap[i][j2] != _gameMap[i][j1]) {
            break;
          } else {
            _gameMap[i][j1] = 2 * _gameMap[i][j1];
            _gameMap[i][j2] = 0;
            /// 在这里有两个块的合并，增加分数
            _currentScore += _gameMap[i][j1] as int;
            widget.onScoreChanged?.call(_currentScore);
            j1 = j2;
            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        j1--;
      }
      int notZeroCount = 0;
      for (int k = 3;k >= 0;k--) {
        if (_gameMap[i][k] != 0) {
          if (k != (3 - notZeroCount)) {
            _gameMap[i][3 - notZeroCount] = _gameMap[i][k];
            _gameMap[i][k] = 0;
            /// 有非0数字和0交换，说明有移动
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
  }

  void _joinGameMapDataToTop() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;
    for (int j = 0; j < 4; j++) {
      int i1 = 0;
      while(i1 < 3) {
        if (_gameMap[i1][j] == 0) {
          i1++;
          continue;
        }
        for (int i2 = i1+1;i2 < 4; i2++) {
          if (_gameMap[i2][j] == 0) {
            continue;
          } else if (_gameMap[i2][j] != _gameMap[i1][j]) {
            break;
          } else {
            _gameMap[i1][j] = 2 * _gameMap[i1][j];
            _gameMap[i2][j] = 0;
            /// 在这里有两个块的合并，增加分数
            _currentScore += _gameMap[i1][j] as int;
            widget.onScoreChanged?.call(_currentScore);
            i1 = i2;
            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        i1++;
      }
      int notZeroCount = 0;
      for (int k = 0;k < 4;k++) {
        if (_gameMap[k][j] != 0) {
          if (k != notZeroCount) {
            _gameMap[notZeroCount][j] = _gameMap[k][j];
            _gameMap[k][j] = 0;
            /// 有非0数字和0交换，说明有移动
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
  }

  void _joinGameMapDataToBottom() {
    _noMoveInSwipe = true;
    for (int j = 0; j < 4; j++) {
      int i1 = 3;
      while(i1 > 0) {
        if (_gameMap[i1][j] == 0) {
          i1--;
          continue;
        }
        for (int i2 = i1-1;i2 >= 0; i2--) {
          if (_gameMap[i2][j] == 0) {
            continue;
          } else if(_gameMap[i2][j] != _gameMap[i1][j]) {
            break;
          } else {
            _gameMap[i1][j] = 2 * _gameMap[i1][j];
            _gameMap[i2][j] = 0;
            _currentScore += _gameMap[i1][j] as int;
            widget.onScoreChanged?.call(_currentScore);
            i1 = i2;
            _noMoveInSwipe = false;
          }
        }
        i1--;
      }
      int notZeroCount = 0;
      for (int k = 3;k >= 0; k--) {
        if (_gameMap[k][j] != 0) {
          if (k != (3 - notZeroCount)) {
            _gameMap[3 - notZeroCount][j] = _gameMap[k][j];
            _gameMap[k][j] = 0;
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
  }

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
                _calculateGameMap(PanDirection.RIGHT);
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
              });
            } else {
              // 向左滑
              debugPrint("向左滑");
              setState(() {
                _calculateGameMap(PanDirection.LEFT);
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
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
                _calculateGameMap(PanDirection.BOTTOM);
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
              });
            } else {
              // 向上滑
              debugPrint("向上滑");
              setState(() {
                _calculateGameMap(PanDirection.TOP);
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
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
                return _buildGameCell(_gameMap[indexI][indexJ]);
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
