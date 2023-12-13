import 'package:flutter/material.dart';

Text loginScreenTexts(String text,
    [double fontSize = 14, Color color = Colors.black]) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: 'Tinos-Regular', fontSize: fontSize, color: color),
  );
}
