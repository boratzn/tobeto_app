import 'package:flutter/material.dart';
import 'package:tobeto_app/widgets/index.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  bool checkBoxState = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Kurum Adı*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "Kampüs 365",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Pozisyon*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "Flutter Developer",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Sektör*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  hintText: "Yazılım",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Şehir Seçiniz*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "İl Seçiniz",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "İş Başlangıcı*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "gg.aa.yyyy",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "İş Bitiş*",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  hintText: "gg.aa.yyyy",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Row(
              children: [
                Checkbox(
                  value: checkBoxState,
                  onChanged: (value) {
                    setState(() {
                      checkBoxState = !checkBoxState;
                    });
                  },
                ),
                Text(
                  "Çalışmaya Devam Ediyorum",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        fontSize: 15,
                      ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            Text(
              "İş Açıklaması",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 5,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 20,
            ),
            SaveButtonWidget(onTap: () {})
          ],
        ),
      ),
    );
  }
}
