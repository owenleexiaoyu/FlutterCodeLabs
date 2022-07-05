# relief_music_player_ui

## 来源

[【Flutter UI】音乐播放器UI —— music player UI](https://www.bilibili.com/video/BV1VT41137JJ?spm_id_from=333.999.0.0&vd_source=581e0a7f58fafc192abc773bb2e5e1ed)

> source：https://www.youtube.com/watch?v=mf2CoM7btfQ

> code ： https://github.com/mitchkoko/musicplayerUI

在 Bilibi 上看到一个浮雕效果很赞的播放器 UI，就来复刻一下，实现效果如下：
![](https://s2.loli.net/2022/07/04/dYbCvBokHerM9PR.png#crop=0&crop=0&crop=1&crop=1&height=760&id=qIOlR&originHeight=1013&originWidth=468&originalType=binary&ratio=1&rotation=0&showTitle=false&status=done&style=none&title=&width=351)

## 实现

总体是利用 BoxShadow 来实现 3D 的浮雕效果。`ReliefBox` 是一个能给其他组件加上浮雕效果的组件，代码如下：

```dart
import 'package:flutter/material.dart';

class ReliefBox extends StatelessWidget {

  const ReliefBox({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            // darker shadow on the bottom right
            BoxShadow(
                color: Colors.grey.shade500,
                blurRadius: 15,
                offset: Offset(5, 5)
            ),
            // lighter shadow on the top left
            BoxShadow(
                color: Colors.white,
                blurRadius: 15,
                offset: Offset(-5, -5)
            ),
          ]
      ),
      child: child,
    );
  }
}
```
