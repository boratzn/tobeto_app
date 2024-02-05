import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting(
        'C# Programlama', startTime, endTime, const Color(0xFF0F8644), false));
    meetings
        .add(Meeting('Veri Bilimi', startTime, endTime, Colors.blue, false));
    meetings.add(Meeting(
        'Flutter Mobil Programlama', startTime, endTime, Colors.red, false));
    return meetings;
  }

  var textController = TextEditingController();
  OptionItem optionItemSelected = OptionItem(title: "Eğitmen Dojo");
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      width: 300,
      child: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
        showDatePickerButton: true,
        showNavigationArrow: true,
        dataSource: MeetingDataSource(_getDataSource()),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
