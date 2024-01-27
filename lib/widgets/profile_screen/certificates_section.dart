import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/profile_screen/certificate_widget.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({
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
              "Sertifikalarım",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            const CertificateWidget(
              title: "Flutter_Certificate",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            const CertificateWidget(
              title: "Flutter_Certificate",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            const CertificateWidget(
              title: "Flutter_Certificate",
            )
          ],
        ),
      ),
    );
  }
}
