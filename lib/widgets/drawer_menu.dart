//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tobeto_app/screens/home_screen.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:tobeto_app/widgets/drawer_menu_item.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
                IconButton(onPressed: () {}, icon: Icon(Icons.close)),
              ],
            ),
            DrawerMenuItem(
              title: "Anasayfa",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ),
            DrawerMenuItem(
              title: "Değerlendirmeler",
              onTap: () {},
            ),
            DrawerMenuItem(
              title: "Profilim",
              onTap: () {},
            ),
            DrawerMenuItem(
              title: "Katalog",
              onTap: () {},
            ),
            DrawerMenuItem(
              title: "Takvim",
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: generalTexts(
                "Tobeto",
                context,
                16,
              ),
              trailing:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
              onTap: () {},
            ),
            Card(
              child: ListTile(
                title: generalTexts(
                  "Profil Adı",
                  context,
                  16,
                ),
                trailing: const CircleAvatar(),
                onTap: () {},
              ),
            ),
            ListTile(
              title: generalTexts(
                "© 2022 Tobeto",
                context,
                16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
