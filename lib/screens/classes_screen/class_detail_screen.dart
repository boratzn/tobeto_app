import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/screens/classes_screen/about_screen.dart';
import 'package:tobeto_app/screens/classes_screen/content_screen.dart';
import 'package:tobeto_app/utils/utils.dart';

class ClassDetailScreen extends ConsumerStatefulWidget {
  const ClassDetailScreen({super.key, required this.item});

  final Training item;

  @override
  ConsumerState<ClassDetailScreen> createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends ConsumerState<ClassDetailScreen> {
  late FlickManager flickManager;
  List<String> headers = ["İçerik", "Hakkında"];
  List<Widget> pages = [];
  int current = 0;

  @override
  void initState() {
    super.initState();
    pages = [
      ContentScreen(contentList: widget.item.contents!),
      AboutScreen(
        training: widget.item,
      )
    ];
    flickManager =
        setVideoController(url: widget.item.contents![0].contentUrl!);
  }

  @override
  void dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: FlickVideoPlayer(
                        flickManager: flickManager,
                        flickVideoWithControls: const FlickVideoWithControls(
                          closedCaptionTextStyle: TextStyle(fontSize: 8),
                          controls: FlickPortraitControls(),
                        ),
                        flickVideoWithControlsFullscreen:
                            const FlickVideoWithControls(
                          controls: FlickLandscapeControls(),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xFF850BEC),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "Mobil Geliştirme | Öğrenme Yolculuğu ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 18),
                    ),
                    trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_border)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FAProgressBar(
                      progressColor: Theme.of(context).colorScheme.primary,
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.3),
                      currentValue: 70,
                      displayText: '%',
                      displayTextStyle: TextStyle(
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.white
                              : Colors.black,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: headers.length,
                  itemBuilder: (context, index) {
                    var header = headers[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(microseconds: 1000),
                          width: 90,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: current == index
                                  ? getPrimaryColor(context)
                                  : Colors.white54,
                              border: Border.all(
                                  width: 2,
                                  color: current == index
                                      ? getPrimaryColor(context)
                                      : Colors.black26)),
                          child: Center(
                            child: Text(
                              header,
                              style: getCommonStyle(context)
                                  .copyWith(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: pages[current],
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(1.0, 0.0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
