import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/button_selected_day.dart';
import 'package:spot/feature/auth/presentation/views/widgets/calender_widgets.dart';
import 'package:spot/feature/auth/presentation/views/widgets/title_show_model.dart';

Future<DateTime?> showDateButtonSheet(
  BuildContext context,
  DateTime initialDate,
) async {
  DateTime selectedDay = initialDate;
  DateTime focusedDay = initialDate;
  return await showModalBottomSheet<DateTime>(
    context: context,
    isScrollControlled: true,
    backgroundColor: ColorManager.witheColor,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(RaduisManager.r10),
      ),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setModalState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.58,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleShowModel(title: TextManager.dateOfBirth),
                CalenderWidget(
                  focusedDay: focusedDay,
                  selectedDay: selectedDay,
                  onDaySelected: (newSelectedDay, newFocusedDay) {
                    setModalState(() {
                      selectedDay = newSelectedDay;
                      focusedDay = newFocusedDay;
                    });
                  },
                ),
                ButtonSelected(
                  onPressed: () => Navigator.pop(context, selectedDay),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
