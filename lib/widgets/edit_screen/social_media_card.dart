import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class SocialMediaCard extends StatefulWidget {
  const SocialMediaCard({super.key, required this.title, required this.url});

  final String title;
  final String url;

  @override
  State<SocialMediaCard> createState() => _SocialMediaCardState();
}

class _SocialMediaCardState extends State<SocialMediaCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 17),
        ),
        Container(
          height: MediaQuery.of(context).size.width / 8,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: MediaQuery.of(context).size.width / 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width * 0.67,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SingleChildScrollView(
                          child: Text(
                            widget.url,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFC6D6D),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(trashImagePath),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFC6D6D),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Image.asset(
                      editImagePath,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
