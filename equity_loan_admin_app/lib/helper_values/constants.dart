import 'package:flutter/material.dart';

class Myconstants {
  static Color homecolor = Color.fromARGB(255, 218, 202, 199);
  static Color color1 = Color.fromARGB(255, 189, 33, 19);
  static Color color2 = Color.fromARGB(255, 253, 253, 253);
  Padding indexedValue(double width, double length, String text, bool bold) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: length * width,
              child: Center(
                child: Text(
                  text,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontWeight: bold ? FontWeight.bold : FontWeight.normal),
                ),
              )),
        ],
      ),
    );
  }
}
