import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/profile_screen/activity_map_container_widget.dart';
import 'package:tobeto_app/widgets/profile_screen/activity_map_widget.dart';

class ActivityMapSection extends StatelessWidget {
  const ActivityMapSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Aktivite Haritam",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: const ActivityMapWidget(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ActivityMapContainerWidget(
                    color: Colors.grey,
                  ),
                  ActivityMapContainerWidget(
                    color: Color(0xFFBB66FF),
                  ),
                  ActivityMapContainerWidget(
                    color: Color(0xFF9933FF),
                  ),
                  ActivityMapContainerWidget(
                    color: Color(0xFF5C1F99),
                  ),
                  ActivityMapContainerWidget(
                    color: Color(0xFF361259),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
