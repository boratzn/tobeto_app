import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/providers/state_provider.dart';
import 'package:tobeto_app/widgets/widgets_index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataInitial) {
          context.read<UserDataBloc>().add(FetchData());
          return const Center(
            child: Text("Veri Yükleniyor"),
          );
        }
        if (state is UserDataLoading) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is UserDataLoaded) {
          var user = state.userInfo!.user;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      title: Text(
                        "TOBETO'ya Hoşgeldin",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "${user.firstName ?? "Kullanıcı"} ${user.lastName ?? ""}",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      trailing: CircleAvatar(
                        radius: 30,
                        backgroundImage: user.imageUrl != null
                            ? NetworkImage(user.imageUrl!)
                            : null,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.width / 50),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Yeni nesil öğrenme deneyimi ile Tobeto kariyer yoculuğunda senin yanında!",
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ),
                const HomePageContainer1(),
                const SizedBox(
                  height: 15,
                ),
                const MyExams(),
                const SizedBox(
                  height: 25,
                ),
                Consumer(
                  builder: (context, ref, child) {
                    var list = [
                      HomePageContainer(
                        title: "Profilini Oluştur",
                        colors: const [
                          Color(0xFF1D0B8C),
                          Color(0xFF604BBB),
                          Color(0xFFE6E7EC)
                        ],
                        onTap: () =>
                            ref.read(pageIndexProvider.notifier).state = 2,
                      ),
                      HomePageContainer(
                        title: "Kendini Değerlendir",
                        colors: const [Color(0xFF0E0B93), Color(0xFF58AAC5)],
                        onTap: () =>
                            ref.read(pageIndexProvider.notifier).state = 1,
                      ),
                      const HomePageContainer(
                        title: "Öğrenmeye Başla",
                        colors: [Color(0xFF3C0B8C), Color(0xFFD89CF6)],
                      ),
                    ];
                    return CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (context, index, realIndex) {
                        var item = list[index];
                        return item;
                      },
                      options: CarouselOptions(
                          autoPlay: true,
                          aspectRatio: 2,
                          enlargeCenterPage: true),
                    );
                  },
                ),
                const SizedBox(
                  height: 45,
                ),
              ],
            ),
          );
        }
        return const Center(
          child: Text("Veriler Yüklenemedi."),
        );
      },
    );
  }
}
