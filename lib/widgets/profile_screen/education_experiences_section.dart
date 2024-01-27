import 'package:flutter/material.dart';

class EducationAndExperiencesSection extends StatelessWidget {
  const EducationAndExperiencesSection({
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
              "Eğitim Hayatım ve Deneyimlerim",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            Wrap(
              children: [
                Text("Henüz bir eğitim ve deneyim bilgisi eklemedin.",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18))
              ],
            )
          ],
        ),
      ),
    );
  }
}
