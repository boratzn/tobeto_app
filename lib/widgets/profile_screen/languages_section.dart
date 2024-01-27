import 'package:flutter/material.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/widgets/profile_screen/languages_widget.dart';

class LanguagesSection extends StatelessWidget {
  const LanguagesSection({
    super.key,
    this.languages,
  });

  final List<Language>? languages;

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
              "Yabancı Dillerim",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: languages!.length,
                itemBuilder: (context, index) {
                  var language = languages![index];
                  return LanguagesWidget(
                      title: language.language ?? "",
                      subtitle: language.level ?? "");
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
