import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class BusinessInformation extends StatefulWidget {
  const BusinessInformation({super.key});

  @override
  State<BusinessInformation> createState() => _BusinessInformationState();
}

class _BusinessInformationState extends State<BusinessInformation> {
  var startDateController = TextEditingController();
  var companyNameController = TextEditingController();
  var positionController = TextEditingController();
  var sectorController = TextEditingController();
  var endDateController = TextEditingController();
  var descriptionController = TextEditingController();
  bool chckBoxState = false;
  OptionItem optionItemSelected = OptionItem(title: "Şehir Seçiniz");
  DateTime? startDate;
  DateTime? endDate;

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
          var businessList = state.userInfo!.business;
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
                    "Kurum Adı*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: companyNameController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
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
                    "Pozisyon*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: positionController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        hintText: "Flutter Developer",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "Sektör*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: sectorController,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 17),
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
                    "Şehir Seçiniz*",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SelectDropList(
                    itemSelected: optionItemSelected,
                    dropListModel: provinceList,
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
                    icon: const Icon(Icons.location_city, color: Colors.black),
                    onOptionSelected: (optionItem) {
                      optionItemSelected = optionItem;
                      setState(() {});
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 15,
                  ),
                  Text(
                    "İş Başlangıcı*",
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
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (dt != null) {
                                startDateController.text =
                                    DateFormat('d/M/y').format(dt).toString();
                                startDate = dt;
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
                    "İş Bitiş*",
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
                        .copyWith(fontSize: 17),
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));

                              if (dt != null) {
                                endDateController.text =
                                    DateFormat('d/M/y').format(dt).toString();
                                endDate = dt;
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
                        value: chckBoxState,
                        onChanged: (value) {
                          setState(() {
                            chckBoxState = !chckBoxState;
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
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: descriptionController,
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
                    height: MediaQuery.of(context).size.width / 20,
                  ),
                  SaveButtonWidget(onTap: () {
                    context.read<UserDataBloc>().add(BusinessUpdate(business: [
                          Business(
                              companyName: companyNameController.text,
                              endDate: endDate,
                              isWorking: chckBoxState,
                              position: positionController.text,
                              province: optionItemSelected.title,
                              sector: sectorController.text,
                              startDate: startDate,
                              workDescription: descriptionController.text)
                        ]));
                  }),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: businessList!.length,
                        itemBuilder: (context, index) {
                          var item = businessList[index];
                          return BusinessListCard(item: item);
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

  void initTextFields(Business? business) {
    if (business != null) {
      startDateController.text = getDateStringFormat(business.startDate);
      companyNameController.text = business.companyName ?? "";
      positionController.text = business.position ?? "";
      sectorController.text = business.sector ?? "";
      endDateController.text = getDateStringFormat(business.endDate);
      descriptionController.text = business.workDescription ?? "";
      optionItemSelected = OptionItem(id: "1", title: business.province ?? "");
      chckBoxState = business.isWorking ?? false;
    }
  }
}
