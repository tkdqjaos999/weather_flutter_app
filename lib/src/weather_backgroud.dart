import 'dart:ui' as prefix0;
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/src/pos.dart';
import 'package:weather_flutter_app/src/sigma.dart';

import 'home_page.dart';

class WeatherBackgroud extends StatelessWidget {
  const WeatherBackgroud({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // 이미지
        Consumer<Pos>(builder: (context, pos, child) {
          return Positioned.fill(
            // 전체화면으로 맞추기
            child: Transform.translate(
              offset: Offset((size.width / 2) * pos.curPos, 0),
              child: Image.asset(
                'asset/city${pos.curPage}.jpg',
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
        // 이펙트 (이펙트를 주고 싶을땐 제일 아래에 이펙트를 작성한다.
        Consumer<Sigma>(
          builder: (context, sigma, child) {
            return Positioned.fill(
                child: BackdropFilter(// 백드랍필터가 이펙트를 주는 부분
              filter: ImageFilter.blur( // 다른 이펙트를 주고 싶으면 이 부분을 바꿔주면 된다.
                  sigmaX: sigma.value, sigmaY: sigma.value),
              child: Container(
                color: Colors.black26.withOpacity(0),
              ),
            ));
          },
        )
      ],
    );
  }
}
