import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:video_player/video_player.dart';

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

String getDateStringFormat(DateTime? date) {
  if (date != null) {
    return DateFormat('d/M/y').format(date);
  }
  return "";
}

(int, int) convertToMinute(int seconds) {
  int minute = 0, second = 0;
  minute = seconds ~/ 60;
  second = seconds % 60;

  return (minute, second);
}

TextStyle getCommonStyle(BuildContext context) {
  return Theme.of(context).textTheme.bodySmall!;
}

Color getPrimaryColor(BuildContext context) {
  return Theme.of(context).colorScheme.primary;
}

FlickManager setVideoController({String? url}) {
  return FlickManager(
    videoPlayerController: VideoPlayerController.networkUrl(
      Uri.parse(url ?? ""),
    ),
    autoPlay: false,
  );
}
