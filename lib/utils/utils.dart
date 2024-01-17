import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Text generalTexts(String text, BuildContext context) {
  return Text(text, style: Theme.of(context).textTheme.titleMedium);
}

void showToast({required String message}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16);
}
