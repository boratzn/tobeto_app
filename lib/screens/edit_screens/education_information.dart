import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class EducationInformation extends StatefulWidget {
  const EducationInformation({super.key});

  @override
  State<EducationInformation> createState() => _EducationInformationState();
}

class _EducationInformationState extends State<EducationInformation> {
  var startDateController = TextEditingController();
  var universityController = TextEditingController();
  var departmentController = TextEditingController();
  var endDateController = TextEditingController();
  OptionItem selectedItem = OptionItem(id: "1", title: "Lisans");
  bool checkBoxState = false;
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          var education = state.userInfo!.education;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Eğitim Durumu*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SelectDropList(
                    itemSelected: selectedItem,
                    dropListModel: gradeList,
                    showIcon: true,
                    showArrowIcon: true,
                    showBorder: true,
                    paddingTop: 0,
                    paddingLeft: 0,
                    paddingRight: 0,
                    paddingBottom: 0,
                    paddingDropItem: const EdgeInsets.only(
                        left: 20, top: 10, bottom: 10, right: 20),
                    suffixIcon: Icons.arrow_drop_down,
                    containerPadding: const EdgeInsets.all(10),
                    icon: const Icon(Icons.school, color: Colors.black),
                    onOptionSelected: (optionItem) {
                      selectedItem = optionItem;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Üniversite*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: universityController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        hintText: "Kampüs 365",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Bölüm*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: departmentController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        hintText: "Yazılım",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Başlangıç Yılı*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: startDateController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (dt != null) {
                                setState(() {
                                  startDateController.text =
                                      DateFormat('d/M/y').format(dt).toString();
                                  startDate = dt;
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        hintText: "gg.aa.yyyy",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Mezuniyet Yılı*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: endDateController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 18),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (dt != null) {
                                setState(() {
                                  endDateController.text =
                                      DateFormat('d/M/y').format(dt).toString();
                                  endDate = dt;
                                });
                              }
                            },
                            icon: const Icon(Icons.date_range)),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
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
                        "Devam Ediyorum",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SaveButtonWidget(
                    onTap: () {
                      context
                          .read<UserDataBloc>()
                          .add(EducationUpdate(education: [
                            Education(
                              department: departmentController.text,
                              educationState: selectedItem.title,
                              startDate: startDate,
                              endDate: endDate,
                              university: universityController.text,
                              isStudying: checkBoxState,
                            )
                          ]));
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: education!.length,
                        itemBuilder: (context, index) {
                          var item = education[index];
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range,
                                            color: Color(0xFFC579FF),
                                          ),
                                          Text(
                                            "${getDateStringFormat(item.startDate)} - ${getDateStringFormat(item.endDate)}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    fontSize: 13,
                                                    color: MediaQuery.of(
                                                                    context)
                                                                .platformBrightness ==
                                                            Brightness.dark
                                                        ? const Color(
                                                            0xFFC579FF)
                                                        : const Color(
                                                            0xFF822BD9)),
                                          ),
                                        ],
                                      ),
                                      Text(item.educationState ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontSize: 13,
                                                  color:
                                                      const Color(0xFF822BD9)))
                                    ],
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.01,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Üniversite",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Colors.grey[700]
                                                              : Colors
                                                                  .grey[400]),
                                                ),
                                                Text(item.university ?? "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(fontSize: 18))
                                              ],
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.03,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Bölüm",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          color: MediaQuery.of(
                                                                          context)
                                                                      .platformBrightness ==
                                                                  Brightness
                                                                      .light
                                                              ? Colors.grey[700]
                                                              : Colors
                                                                  .grey[400]),
                                                ),
                                                Text(item.department ?? "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(fontSize: 18))
                                              ],
                                            )
                                          ],
                                        )),
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.red,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: const Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Icon(Icons.delete),
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ))
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
}
