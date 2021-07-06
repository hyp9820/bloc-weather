import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:weather/SearchPage.dart';
import 'package:weather/WeatherScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      // home: MyHomePage(title: 'Weather App'),
      routes: {
        '/': (context) => SearchPage(),
        '/display': (context) => WeatherScreen(),
      },
    );
  }
}
