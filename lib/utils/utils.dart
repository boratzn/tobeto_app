import 'package:flutter/material.dart';

Text loginScreenTexts(String text,
    [double fontSize = 14, Color color = Colors.black]) {
  return Text(
    text,
    style: TextStyle(fontFamily: 'Tinos', fontSize: fontSize, color: color),
  );
}

const TextStyle textStyle = TextStyle(fontFamily: 'Tinos');
