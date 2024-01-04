import 'package:flutter/material.dart';

class ActivityMapContainerWidget extends StatelessWidget {
  const ActivityMapContainerWidget({
    super.key,
    required this.color,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: MediaQuery.of(context).size.height / 40,
        width: MediaQuery.of(context).size.width / 18,
        color: color,
      ),
    );
  }
}
