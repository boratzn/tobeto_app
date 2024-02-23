import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'package:tobeto_app/blocs/user_data/user_data_bloc.dart';
import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/models/education.dart';

class EducationAndExperiencesSection extends StatelessWidget {
  const EducationAndExperiencesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<dynamic> list = [];
    return BlocBuilder<UserDataBloc, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoaded) {
          List<Education> educationList = state.userInfo!.education ?? [];
          List<Business> businessList = state.userInfo!.business ?? [];

          educationList.sort((a, b) => a.startDate!.compareTo(b.startDate!));
          businessList.sort((a, b) => a.startDate!.compareTo(b.startDate!));
          list.clear();
          list.addAll(educationList);
          list.addAll(businessList);
          list.sort((a, b) => a.startDate.compareTo(b.startDate));

          return Card(
            shadowColor: Theme.of(context).colorScheme.background,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Eğitim Hayatım ve Deneyimlerim",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 2),
                  list.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              var item = list[index];
                              if (item is Education) {
                                return TimeLineWidget(
                                    title: item.university ?? "",
                                    department: item.department ?? "",
                                    startDate: item.startDate != null
                                        ? item.startDate!.year.toString()
                                        : "",
                                    endDate: item.endDate != null
                                        ? item.endDate!.year.toString()
                                        : "",
                                    index: index,
                                    length: list.length);
                              }
                              if (item is Business) {
                                return TimeLineWidget(
                                    title: item.companyName ?? "",
                                    department: item.position ?? "",
                                    startDate: item.startDate != null
                                        ? item.startDate!.year.toString()
                                        : "",
                                    endDate: item.endDate != null
                                        ? item.endDate!.year.toString()
                                        : "",
                                    index: index,
                                    length: list.length);
                              }
                              return null;
                            },
                          ),
                        )
                      : Text(
                          "Herhangi bir eğitim veya iş deneyimi bilgisi bulunmamaktadır.",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 18),
                        )
                ],
              ),
            ),
          );
        }

        return Center(
          child: Text(
            "Veriler yüklenemedi",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        );
      },
    );
  }
}

class TimeLineWidget extends StatelessWidget {
  const TimeLineWidget({
    Key? key,
    required this.title,
    this.startDate,
    this.endDate,
    required this.department,
    required this.index,
    required this.length,
  }) : super(key: key);

  final String title;
  final String? startDate;
  final String? endDate;
  final String department;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      afterLineStyle: const LineStyle(color: Color(0xFF470084)),
      beforeLineStyle: const LineStyle(color: Color(0xFF470084)),
      axis: TimelineAxis.horizontal,
      alignment: TimelineAlign.center,
      isFirst: index == 0 ? true : false,
      isLast: index != 0
          ? index == length - 1
              ? true
              : false
          : false,
      indicatorStyle:
          const IndicatorStyle(drawGap: true, color: Color(0xFF470084)),
      startChild: index % 2 == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  startDate != null || endDate != null
                      ? Text(
                          "$startDate/$endDate",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 16),
                        )
                      : Center(),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                  Text(
                    department,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            )
          : null,
      endChild: index % 2 != 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  startDate != null || endDate != null
                      ? Text(
                          "$startDate/$endDate",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(fontSize: 16),
                        )
                      : Center(),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                  Text(
                    department,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: 16),
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
