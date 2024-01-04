import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';

class UserInformations extends StatefulWidget {
  const UserInformations({super.key});

  @override
  State<UserInformations> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: MediaQuery.of(context).size.width / 5),
                  Positioned(
                    bottom: MediaQuery.of(context).size.width / 25,
                    left: MediaQuery.of(context).size.width / 40,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xFFFC6D6D),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 20,
                              width: 16,
                              child: Image.asset(
                                trashImagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.width / 25,
                    right: MediaQuery.of(context).size.width / 40,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {},
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 20,
                              width: 16,
                              child: Image.asset(
                                editImagePath,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text(
              "Adınız*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "User name",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Soyadınız*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "Surname",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Telefon Numaranız*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  hintText: "+90 *** *** ** **",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Doğum Tarihiniz*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? dt = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100));

                        if (dt != null) {
                          // expModel.selectedDate = dt;
                          // _controllerDate.text = DateFormat(
                          //         'd/M/y')
                          //     .format(expModel.selectedDate!)
                          //     .toString();
                        }
                      },
                      icon: const Icon(Icons.date_range)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "TC Kimlik No*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Text(
              "*Aboneliklerde fatura için doldurulması zorunlu alan",
              style: TextStyle(
                  color: Colors.red, fontStyle: FontStyle.italic, fontSize: 15),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "E-Posta*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Ülke*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "İl*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "İstanbul",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "İlçe*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Mahalle / Sokak*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 5,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            Text(
              "Hakkımda*",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: MediaQuery.of(context).platformBrightness ==
                            Brightness.light
                        ? Colors.black54
                        : Colors.grey,
                  ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              maxLines: 5,
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 18),
              initialValue: "",
              decoration: InputDecoration(
                  hintText: "Kendini kısaca tanıt",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Kaydet",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  )),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
