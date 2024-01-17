import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/screens/index.dart';
import 'package:tobeto_app/user_auth/firebase_auth_services.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/index.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    var authService = FirebaseAuthService();
    void onPressed(WidgetRef ref, int index) {
      ref.read(pageIndexProvider.notifier).state = index;
      Navigator.pop(context);
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer(
          builder: (context, ref, child) {
            return ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      height: 100,
                      child: Image.asset(
                        "assets/images/tobeto-logo.png",
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).colorScheme.onSurface,
                        )),
                  ],
                ),
                DrawerMenuItem(
                    title: "Anasayfa",
                    onTap: () {
                      onPressed(ref, 0);
                    }),
                DrawerMenuItem(
                  title: "Değerlendirmeler",
                  onTap: () {
                    onPressed(ref, 1);
                  },
                ),
                DrawerMenuItem(
                  title: "Profilim",
                  onTap: () {
                    onPressed(ref, 2);
                  },
                ),
                DrawerMenuItem(
                  title: "Katalog",
                  onTap: () {
                    onPressed(ref, 3);
                  },
                ),
                DrawerMenuItem(
                  title: "Takvim",
                  onTap: () {
                    onPressed(ref, 4);
                  },
                ),
                Divider(
                  color: Theme.of(context).dividerColor,
                ),
                ListTile(
                  title: generalTexts(
                    "Tobeto",
                    context,
                  ),
                  trailing: const Icon(Icons.home),
                  onTap: () {},
                ),
                BlocBuilder<UserDataBloc, UserDataState>(
                  builder: (context, state) {
                    if (state is UserDataLoading) {}
                    if (state is UserDataLoaded) {
                      return Card(
                        color: Theme.of(context).colorScheme.surface,
                        child: ListTile(
                          title: generalTexts(
                            "${state.user!.firstName} ${state.user!.lastName}",
                            context,
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.grey,
                            child: Icon(Icons.person,
                                color: Theme.of(context).iconTheme.color),
                          ),
                          onTap: () {},
                        ),
                      );
                    }
                    return ListTile(
                      title: generalTexts("Kullanıcı bilgisi yok.", context),
                    );
                  },
                ),
                ListTile(
                    title: generalTexts("Çıkış Yap", context),
                    onTap: () {
                      authService.signOut();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    trailing: const Icon(Icons.exit_to_app)),
                ListTile(
                  title: Text(
                    "© 2022 Tobeto",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
