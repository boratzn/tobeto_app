import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/widgets/profile_screen/badge_widget.dart';

class BadgesSection extends StatelessWidget {
  const BadgesSection({
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
              "Yetkinlik Rozetlerim",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const BadgeWidget(imgPath: hikRozetImagePath),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 60,
                  ),
                  const BadgeWidget(imgPath: hikRozetImagePath),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
