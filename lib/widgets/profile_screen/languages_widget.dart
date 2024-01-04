import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class LanguagesWidget extends StatelessWidget {
  const LanguagesWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
      child: ListTile(
        leading: Image.asset(globeImagePath),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black54
                    : Colors.white,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.black45
                    : Colors.white,
              ),
        ),
        trailing: Image.asset(homeImagePath),
      ),
    );
  }
}
