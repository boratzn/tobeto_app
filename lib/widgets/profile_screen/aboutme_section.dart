import 'package:flutter/material.dart';
import 'package:tobeto_app/models/user_all_info.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({
    super.key,
    required this.userData,
  });

  final UserAllInfo? userData;

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
              "Hakkımda",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            //Buraya Hakkımdaki bilgiler gelecek
            Text(
              userData!.user.aboutMe ?? "Hakkında birşeyler yaz",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
