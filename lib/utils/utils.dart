import 'package:flutter/material.dart';

Text generalTexts(String text, BuildContext context, [double fontSize = 14]) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: 'Tinos',
        fontSize: fontSize,
        color: Theme.of(context).colorScheme.onSurface),
  );
}

const TextStyle textStyle = TextStyle(fontFamily: 'Tinos');
