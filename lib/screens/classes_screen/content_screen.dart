import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/utils/utils.dart';

class ContentScreen extends StatefulWidget {
  const ContentScreen({super.key, required this.contentList});

  final List<Content> contentList;

  @override
  State<ContentScreen> createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.contentList.isNotEmpty
          ? ListView.builder(
              itemCount: widget.contentList.length,
              itemBuilder: (context, index) {
                var content = widget.contentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer(
                    builder: (context, ref, child) {
                      return GestureDetector(
                        onTap: () {},
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          trailing: const Icon(
                            Icons.play_arrow_rounded,
                          ),
                          tileColor: getPrimaryColor(context).withOpacity(0.3),
                          title: Text(
                            content.contentName ?? "İçerik",
                            style:
                                getCommonStyle(context).copyWith(fontSize: 18),
                          ),
                          subtitle: Text(
                            "${convertToMinute(content.time!).$1}.${convertToMinute(content.time!).$2} dk",
                            style:
                                getCommonStyle(context).copyWith(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text("İçerik bulunmamaktadır."),
            ),
    );
  }
}
