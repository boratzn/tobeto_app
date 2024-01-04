import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/screens/index.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/index.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    void _onPressed(WidgetRef ref, int index) {
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
                        icon: const Icon(Icons.close)),
                  ],
                ),
                DrawerMenuItem(
                    title: "Anasayfa",
                    onTap: () {
                      _onPressed(ref, 0);
                    }),
                DrawerMenuItem(
                  title: "Değerlendirmeler",
                  onTap: () {
                    _onPressed(ref, 1);
                  },
                ),
                DrawerMenuItem(
                  title: "Profilim",
                  onTap: () {
                    _onPressed(ref, 2);
                  },
                ),
                DrawerMenuItem(
                  title: "Katalog",
                  onTap: () {
                    _onPressed(ref, 3);
                  },
                ),
                DrawerMenuItem(
                  title: "Takvim",
                  onTap: () {
                    _onPressed(ref, 4);
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
                  trailing: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.home)),
                  onTap: () {},
                ),
                Card(
                  color: Theme.of(context).cardTheme.color,
                  child: ListTile(
                    title: generalTexts(
                      "Profil Adı",
                      context,
                    ),
                    trailing: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person,
                          color: Theme.of(context).iconTheme.color),
                    ),
                    onTap: () {},
                  ),
                ),
                ListTile(
                    title: generalTexts("Çıkış Yap", context),
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                    },
                    trailing: Icon(Icons.exit_to_app)),
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
