import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/widgets/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataInitial) {
          context.read<UserDataBloc>().add(FetchData());
          return const Padding(
            padding: EdgeInsets.all(32.0),
            child: Center(
              child: Text("Veri Yükleniyor"),
            ),
          );
        }
        if (state is UserDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserDataLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 20,
                ),
                Text.rich(
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'TOBETO',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: "'ya hoşgeldin \n ${state.user!.firstName}.",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
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
                SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      HomePageContainer(
                        title: "Profilini Oluştur",
                        colors: [
                          Color(0xFF1D0B8C),
                          Color(0xFF604BBB),
                          Color(0xFFE6E7EC)
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      HomePageContainer(
                        title: "Kendini Değerlendir",
                        colors: [Color(0xFF0E0B93), Color(0xFF58AAC5)],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      HomePageContainer(
                        title: "Öğrenmeye Başla",
                        colors: [Color(0xFF3C0B8C), Color(0xFFD89CF6)],
                      ),
                    ],
                  ),
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
