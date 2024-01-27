import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({
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
              "Medya Hesaplarım",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Image.asset(
                      cvGithubImagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height / 40,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {},
                    child: Image.asset(
                      cvLinkedinImagePath,
                      height: 60,
                      width: 60,
                      fit: BoxFit.contain,
                    ),
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
