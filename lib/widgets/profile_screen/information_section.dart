import 'package:flutter/material.dart';
import 'package:tobeto_app/constants/constants.dart';
import 'package:tobeto_app/models/user_all_info.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/profile_screen/information_widget.dart';

class InformationSection extends StatelessWidget {
  const InformationSection({
    super.key,
    required this.userData,
  });

  final UserAllInfo? userData;

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              color: const Color(0xFF6A70DE),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: CircleAvatar(
                  backgroundImage: userData!.user.imageUrl != null
                      ? NetworkImage(
                          userData!.user.imageUrl!,
                        )
                      : null,
                ),
              ),
            ),
          ),
          InformationCard(
              title: "Ad Soyad",
              subTitle:
                  "${userData!.user.firstName} ${userData!.user.lastName}",
              imgPath: cvNameImagePath),
          InformationCard(
              title: "Doğum Tarihi",
              subTitle: getDateStringFormat(
                  userData!.user.birthDate ?? DateTime(2000, 1, 1)),
              imgPath: cvDateImagePath),
          InformationCard(
              title: "E-Posta Adresi",
              subTitle: userData!.user.email ?? "username@gmail.com",
              imgPath: cvMailImagePath),
          InformationCard(
              title: "Telefon Numarası",
              subTitle: userData!.user.phoneNumber ?? "+905055555555",
              imgPath: cvPhoneImagePath),
        ],
      ),
    );
  }
}
