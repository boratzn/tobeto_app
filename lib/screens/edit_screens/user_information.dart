import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/edit_screen/save_button_widget.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key, this.userModel});

  final UserModel? userModel;

  @override
  State<UserInformation> createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformation> {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var birthDateController = TextEditingController();
  var idController = TextEditingController();
  var emailController = TextEditingController();
  var countryController = TextEditingController();
  var provinceController = TextEditingController();
  var districtController = TextEditingController();
  var neighbourhoodController = TextEditingController();
  var aboutMeController = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  var countryCode = "";
  DateTime? birthDate;

  Future<void> openImagePicker() async {
    var selectedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (selectedFile != null) {
      setState(() {
        selectedImage = File(selectedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDataLoaded) {
          var user = state.userInfo;
          initTextFields(user!.user);
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
                          backgroundImage: user.user.imageUrl != null
                              ? NetworkImage(
                                  user.user.imageUrl!,
                                )
                              : null,
                          backgroundColor: Colors.grey,
                          radius: MediaQuery.of(context).size.width / 5,
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).size.width / 25,
                          left: MediaQuery.of(context).size.width / 40,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () {
                              context.read<UserDataBloc>().add(DeleteImage());
                            },
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
                            onTap: () {
                              openImagePicker().then((value) {
                                if (selectedImage != null) {
                                  context.read<UserDataBloc>().add(UploadImage(
                                      selectedFile: selectedImage!));
                                }
                              });
                            },
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
                          fontSize: 20,
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
                    controller: firstNameController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Soyadınız*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: lastNameController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Telefon Numaranız*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
                          color: MediaQuery.of(context).platformBrightness ==
                                  Brightness.light
                              ? Colors.black54
                              : Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (value) {
                          setState(() {
                            countryCode = value.dialCode ?? "";
                          });
                        },
                        //initialSelection: 'TR',
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        dialogTextStyle: const TextStyle(fontSize: 15),
                        boxDecoration: const BoxDecoration(),
                        flagWidth: 20,
                      ),
                      Expanded(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: TextFormField(
                            controller: phoneNumberController,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 17),
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              hintText: "+90 *** *** ** **",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Doğum Tarihiniz*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: birthDateController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (dt != null) {
                                setState(() {
                                  birthDateController.text =
                                      DateFormat('d/M/y').format(dt).toString();
                                  birthDate = dt;
                                });
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
                          fontSize: 20,
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
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    keyboardType: TextInputType.number,
                    controller: idController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  const Text(
                    "*Aboneliklerde fatura için doldurulması zorunlu alan",
                    style: TextStyle(
                        color: Colors.red,
                        fontStyle: FontStyle.italic,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "E-Posta*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: emailController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Ülke*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: countryController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "İl*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: provinceController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "İlçe*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: districtController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Mahalle / Sokak*",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 20,
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
                    controller: neighbourhoodController,
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
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
                          fontSize: 20,
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
                    controller: aboutMeController,
                    maxLines: 5,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        hintText: "Kendini kısaca tanıt",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context.read<UserDataBloc>().add(UserInformationUpdate(
                              model: UserModel(
                            firstNameController.text,
                            lastNameController.text,
                            emailController.text,
                            user.user.imageUrl,
                            countryCode + phoneNumberController.text,
                            birthDate,
                            idController.text,
                            countryController.text,
                            provinceController.text,
                            districtController.text,
                            neighbourhoodController.text,
                            aboutMeController.text,
                          )));
                    },
                  ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height / 5,
                  // )
                ],
              ),
            ),
          );
        }
        return const Center(
          child: Text("Veriler alınırken hata oluştu."),
        );
      },
    );
  }

  void initTextFields(UserModel user) {
    firstNameController.text = user.firstName!;
    lastNameController.text = user.lastName!;
    phoneNumberController.text = user.phoneNumber ?? "";
    birthDateController.text = getDateStringFormat(user.birthDate);
    idController.text = user.id ?? "";
    emailController.text = user.email ?? "";
    countryController.text = user.country ?? "";
    provinceController.text = user.province ?? "";
    districtController.text = user.distrinct ?? "";
    neighbourhoodController.text = user.neighborhood ?? "";
    aboutMeController.text = user.aboutMe ?? "";
  }
}
