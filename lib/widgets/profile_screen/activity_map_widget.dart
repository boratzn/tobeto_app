import 'package:flutter/material.dart';

class ActivityMapWidget extends StatefulWidget {
  const ActivityMapWidget({super.key});

  @override
  State<ActivityMapWidget> createState() => _ActivityMapWidgetState();
}

class _ActivityMapWidgetState extends State<ActivityMapWidget> {
  Color color = Colors.grey;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 40,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: 371,
        itemBuilder: (BuildContext context, int index) {
          bool isSelected = selectedIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                  color: isSelected ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(5)),
            ),
          );
        },
      ),
    );
  }
}
