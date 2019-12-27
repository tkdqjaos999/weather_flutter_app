import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/src/sigma.dart';
import 'package:weather_flutter_app/src/weather_backgroud.dart';

import 'home_page.dart';

final double blur = 8;

class WeatherPage extends StatefulWidget {
  final Sigma _sigma = new Sigma();

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  ScrollController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController()..addListener(_onScrolled);
    super.initState();
  }

  _onScrolled() {
    widget._sigma.setSigma(_controller.offset / size.height * blur);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ChangeNotifierProvider.value(
            value: widget._sigma, child: new WeatherBackgroud()),
        ListView(
          controller: _controller,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              color: Colors.black26,
              width: size.width,
              height: size.height,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '21\'C',
                  textScaleFactor: 8,
                  style: TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.white),
                ),
              ),
            ),
            Container(
              color: Colors.black26,
              width: size.width,
              height: size.height,
            )
          ],
        )
      ],
    );
  }
}
