import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/constants/constants.dart';

class SocialMediaSection extends StatelessWidget {
  const SocialMediaSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String smImagePath(String name) {
      switch (name) {
        case 'Github':
          return cvGithubImagePath;
        case 'Linkedin':
          return cvLinkedinImagePath;
        case 'Instagram':
          return cvInstagramImagePath;
      }
      return "";
    }

    return Card(
      shadowColor: Theme.of(context).colorScheme.background,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Medya Hesaplarım",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const Divider(thickness: 2),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            BlocBuilder<UserDataBloc, UserDataState>(
              builder: (context, state) {
                if (state is UserDataLoaded) {
                  var smList = state.userInfo!.socialMedias ?? [];
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = smList[index];
                          return InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {},
                            child: Image.asset(
                              smImagePath(item.name!),
                              height: 60,
                              width: 60,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                        itemCount: smList.length),
                  );
                }

                return const Text("Veriler Yüklenemedi");
              },
            )
          ],
        ),
      ),
    );
  }
}
