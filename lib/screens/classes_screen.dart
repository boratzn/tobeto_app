import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/widgets/homepage/my_classes_card.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eğitimlerim",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
      body: BlocBuilder<UserDataBloc, UserDataState>(
        builder: (context, state) {
          if (state is UserDataLoaded) {
            var trainingList = state.userInfo!.trainings;
            return trainingList!.isNotEmpty
                ? GridView.builder(
                    itemCount: trainingList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.35),
                    itemBuilder: (context, index) {
                      var item = trainingList[index];
                      return MyClassesCard(
                          imagePath: item.imgUrl!,
                          title: item.name!,
                          date: item.date!);
                    },
                  )
                : Center(
                    child: Text(
                      "Atanmış bir eğitiminiz bulunmamaktadır.",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  );
          }
          return Container();
        },
      ),
    );
  }
}
