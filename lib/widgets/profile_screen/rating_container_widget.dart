import 'package:flutter/material.dart';

class RatingContainerWidget extends StatelessWidget {
  const RatingContainerWidget(
      {super.key,
      required this.text,
      required this.rating,
      required this.color});

  final String text;
  final String rating;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 30,
          width: MediaQuery.of(context).size.width / 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              rating,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 13, color: Colors.white),
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.height / 90,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 15),
        )
      ],
    );
  }
}
