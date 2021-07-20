import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './myQuiz.dart';

void main() => runApp(MyColors());

class MyColors extends StatefulWidget {
  const MyColors({Key key}) : super(key: key);

  @override
  _MyColorsState createState() => _MyColorsState();
}

class _MyColorsState extends State<MyColors> {
  String dropdownValue;
  Color get color {
    if (dropdownValue == "blue") {
      return Colors.blue;
    } else if (dropdownValue == "green") {
      return Colors.green;
    } else if (dropdownValue == "red") {
      return Colors.red;
    } else if (dropdownValue == "yellow") {
      return Colors.yellow;
    } else if (dropdownValue == "purple") {
      return Colors.purple;
    }
    return Colors.white;
  }

  getItems() {
    return <String>["blue", "green", "red", "yellow", "purple"]
        .map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Text(value)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Switch Colors"),
          backgroundColor: Colors.grey[850],
          centerTitle: true,
        ),
        backgroundColor: color,
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 300,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: DropdownButtonHideUnderline(
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        canvasColor: Colors.white60,
                        buttonTheme: ButtonThemeData(
                          alignedDropdown: true,
                        )),
                    child: DropdownButton<String>(
                      hint: Text("Choose a Color"),
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: getItems().toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
