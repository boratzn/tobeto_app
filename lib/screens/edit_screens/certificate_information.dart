import 'dart:io';

import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/utils/utils.dart';
//import 'package:tobeto_app/widgets/edit_screen/save_button_widget.dart';

class CertificateInformation extends StatefulWidget {
  const CertificateInformation({super.key});

  @override
  State<CertificateInformation> createState() => _CertificatesState();
}

class _CertificatesState extends State<CertificateInformation> {
  File? selectedFile;
  List<Widget> widgetList = const [
    Text("Dosya Adı"),
    Text("Dosya Türü"),
    Text("Tarih"),
    Text("İşlem"),
  ];

  Future<void> openPdfPicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      setState(() {
        selectedFile = File(result.files.first.path!);
      });
    }
  }

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
              height: MediaQuery.of(context).size.height * 0.01,
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
                    onTap: () async {
                      await openPdfPicker();
                      if (selectedFile != null) {
                        context
                            .read<UserDataBloc>()
                            .add(UploadCertificate(file: selectedFile));
                      } else {
                        showToast(message: "Dosya Seçilmedi!");
                      }
                    },
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // SaveButtonWidget(
            //   onTap: () {
            //     context
            //         .read<UserDataBloc>()
            //         .add(UploadCertificate(file: selectedFile));
            //   },
            // )
            //Sertifikalar gelecek
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                if (state is UserDataLoaded) {
                  var certificates = state.userInfo!.certificates ?? [];
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      dataTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 15),
                      headingRowColor: MaterialStatePropertyAll(
                          MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.grey[400]
                              : Colors.grey[700]),
                      border: TableBorder.all(color: Colors.grey),
                      columns: List.generate(widgetList.length,
                          (index) => DataColumn(label: widgetList[index])),
                      rows: List.generate(
                        certificates.length,
                        (index) {
                          var certificate = certificates[index];
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  certificate.name ?? "",
                                ),
                              ),
                              DataCell(
                                Image.asset(
                                  pdfImagePath,
                                  width: 30,
                                  height: 30,
                                ),
                              ),
                              DataCell(
                                Text(
                                  getDateStringFormat(certificate.createdDate),
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                "Uyarı",
                                              ),
                                              content: Text(
                                                  "Dosyayı indirmek istiyor musunuz?",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(fontSize: 18)),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Kapat",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    context
                                                        .read<UserDataBloc>()
                                                        .add(
                                                          DownloadCertificate(
                                                              certificate:
                                                                  certificate),
                                                        );
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text(
                                                    "Evet",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(
                                        Icons.download,
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    IconButton(
                                      iconSize: 30,
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 25,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                return Text(
                  "Veriler Alınamadı!!",
                  style: Theme.of(context).textTheme.bodySmall,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
