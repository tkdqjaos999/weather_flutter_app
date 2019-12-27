import 'package:flutter/material.dart';
import 'package:weather_flutter_app/src/pos.dart';
import 'package:provider/provider.dart';
import 'package:weather_flutter_app/src/weather_page.dart';

final List<Widget> _weatherPage = [];
final List<Pos> _posList = [];
Size size;
// 여기에 선언해주면 재빌드 될때 다시 설정되지 않음

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController()..addListener(_onScroll);
    for (int i = 0; i < 4; i++) {
      var newPos = Pos(i);
      _weatherPage.add(ChangeNotifierProvider.value(value: newPos, child: WeatherPage(),));
      _posList.add(newPos);
    }
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onScroll() {
    double pagePos = _controller.page;
    _posList[pagePos.truncate().toInt()].setPosition(pagePos);
    //truncate 소수점 아래 제외 페이지만 가져온다
  }

  @override
  Widget build(BuildContext context) {
    if (size == null) size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: _weatherPage,
      ),
    );
  }
}
