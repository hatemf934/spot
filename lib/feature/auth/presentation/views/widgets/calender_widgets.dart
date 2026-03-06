import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/font_manager.dart';
import 'package:spot/core/utils/padding_manager.dart';
import 'package:spot/core/utils/styles.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderWidget extends StatefulWidget {
  const CalenderWidget({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.onDaySelected,
  });
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Function(DateTime, DateTime) onDaySelected;
  @override
  State<CalenderWidget> createState() => _CalenderWidgetState();
}

class _CalenderWidgetState extends State<CalenderWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(1900, 1, 1),
      lastDay: DateTime.now(),
      focusedDay: widget.focusedDay,
      startingDayOfWeek: StartingDayOfWeek.monday,
      selectedDayPredicate: (day) => isSameDay(day, widget.selectedDay),
      onDaySelected: widget.onDaySelected,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
        titleTextStyle: Styles.textStyle20,
        leftChevronIcon: Icon(
          Icons.chevron_left,
          color: ColorManager.blackColor,
          size: FontManager.f28,
        ),
        rightChevronIcon: Icon(
          Icons.chevron_right,
          color: ColorManager.blackColor,
          size: FontManager.f28,
        ),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: Styles.textStyle12,
        weekendStyle: Styles.textStyle12,
      ),
      calendarStyle: CalendarStyle(
        isTodayHighlighted: false,
        selectedDecoration: BoxDecoration(
          color: ColorManager.primaryColor,
          shape: BoxShape.rectangle,
        ),
        selectedTextStyle: TextStyle(
          color: ColorManager.witheColor,
          fontWeight: FontWeight.bold,
        ),
        cellMargin: EdgeInsets.all(PaddingManager.p5),
      ),
    );
  }
}
