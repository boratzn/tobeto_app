import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class CertificateWidget extends StatelessWidget {
  const CertificateWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(35),
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        child: ListTile(
          title: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(
              title,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
          ),
          trailing: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Image.asset(pdfImagePath),
          ),
        ),
      ),
    );
  }
}
