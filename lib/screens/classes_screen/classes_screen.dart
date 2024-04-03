import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tobeto_app/blocs/trainings/trainings_bloc.dart';
import 'package:tobeto_app/widgets/homepage/my_classes_card.dart';

class ClassesScreen extends StatelessWidget {
  const ClassesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Eğitimlerim",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          shadowColor: Colors.black,
          elevation: 2),
      body: BlocBuilder<TrainingsBloc, TrainingsState>(
        builder: (context, state) {
          if (state is TrainingsLoading) {
            context.read<TrainingsBloc>().add(GetTrainings());
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TrainingsLoaded) {
            var trainingList = state.trainings;
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
                        item: item,
                      );
                    },
                  )
                : Center(
                    child: Text(
                      "Atanmış bir eğitiminiz bulunmamaktadır.",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  );
          }
          return Center(
            child: Text(
              "Eğitimler yüklenirken sorun oluştu!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          );
        },
      ),
    );
  }
}
