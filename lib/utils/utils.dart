import 'package:flutter/material.dart';

Text generalTexts(String text, BuildContext context) {
  return Text(text, style: Theme.of(context).textTheme.titleMedium);
}
