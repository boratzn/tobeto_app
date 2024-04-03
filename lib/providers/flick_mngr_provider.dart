import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/utils/utils.dart';

class FlickManagerProvider extends StateNotifier<FlickManager> {
  FlickManagerProvider(super.state);

  void setFlickManager(String url) {
    state = setVideoController(url: url);
  }
}
