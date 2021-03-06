import 'dart:ui';

class Game2048Colors {

  /// 背景颜色
  static Color bgColor1 = Color(0xFFFAF8EF);
  static Color bgColor2 = Color(0xFFBBAD9F);
  static Color bgColor3 = Color(0xFF8F7B65);

  /// 文字颜色
  static Color textColor1 = Color(0xFF766E65);
  static Color textColor2 = Color(0xFFF8F6F2);
  static Color textColor3 = Color(0xFFFFFFFF);


  /// 数字的背景色
  static Color gc0 = Color(0xFFCCC1B4);  /// 不展示数字
  static Color gc2 = Color(0xFFEDE4DA);
  static Color gc4 = Color(0xFFEEE0CA);
  static Color gc8 = Color(0xFFF3B279);
  static Color gc16 = Color(0xFFF69564);
  static Color gc32 = Color(0xFFF77C5F);
  static Color gc64 = Color(0xFFF75F3C);
  static Color gc128 = Color(0xFFEDD073);
  static Color gc256 = Color(0xFFEECB62);
  static Color gc512 = Color(0xFFEDC850);
  static Color gc1024 = Color(0xFFEDC850);
  static Color gc2048 = Color(0xFFEDC850);

  static Color mapValueToColor(int value) {
    switch(value){
      case 0:
        return Game2048Colors.gc0;
      case 2:
        return Game2048Colors.gc2;
      case 4:
        return Game2048Colors.gc4;
      case 8:
        return Game2048Colors.gc8;
      case 16:
        return Game2048Colors.gc16;
      case 32:
        return Game2048Colors.gc32;
      case 64:
        return Game2048Colors.gc64;
      case 128:
        return Game2048Colors.gc128;
      case 256:
        return Game2048Colors.gc256;
      case 512:
        return Game2048Colors.gc512;
      case 1024:
        return Game2048Colors.gc1024;
      case 2048:
        return Game2048Colors.gc2048;
      default:
        return Game2048Colors.gc2048;
    }
  }
}