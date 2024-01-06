import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class CertificateInformation extends StatefulWidget {
  const CertificateInformation({super.key});

  @override
  State<CertificateInformation> createState() => _CertificatesState();
}

class _CertificatesState extends State<CertificateInformation> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Text(
              "Sertifikalarım",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 20),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              decoration: DottedDecoration(
                  shape: Shape.box,
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primary),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      uploadImagePath,
                      width: 80,
                      height: 80,
                    ),
                  ),
                  Text(
                    "Dosya Yükle",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
            //Sertifikalar gelecek
          ],
        ),
      ),
    );
  }
}
