import 'package:flutter/material.dart';
import 'package:weather/WeatherModel.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({Key? key}) : super(key: key);
  // final WeatherModel weather;
  // final city;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as WeatherArguments;

    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        title: Text("Weather App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(),
          child: Container(
            padding: EdgeInsets.only(right: 32, left: 32, top: 100),
            child: Column(
              children: <Widget>[
                Text(
                  args.city,
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  args.weather.getTemp.round().toString() + "\u2103",
                  style: TextStyle(color: Colors.white70, fontSize: 50),
                ),
                Text(
                  "Temperature",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          args.weather.getMinTemp.round().toString() + "\u2103",
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Min Temperature",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: <Widget>[
                        Text(
                          args.weather.getMaxTemp.round().toString() + "\u2103",
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Max Temperature",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          args.weather.pressure.toString() + " hPa",
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Pressure",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: <Widget>[
                        Text(
                          args.weather.humidity.toString() + "%",
                          style: TextStyle(color: Colors.white70, fontSize: 30),
                        ),
                        Text(
                          "Humidity",
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
