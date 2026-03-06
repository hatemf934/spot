import 'package:flutter/material.dart';
import 'package:spot/core/utils/color_manager.dart';
import 'package:spot/core/utils/raduis_manager.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/button_selected_day.dart';
import 'package:spot/feature/auth/presentation/views/widgets/gender_selected.dart';
import 'package:spot/feature/auth/presentation/views/widgets/title_show_model.dart';

Future<String?> showGenderButtonSheet(
  BuildContext context,
  String initialGender,
) async {
  return await showModalBottomSheet(
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
        builder: (context, setState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TitleShowModel(title: TextManager.gender),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                GenderSelected(
                  selectedGender: initialGender,
                  onChanged: (value) => setState(() {
                    initialGender = value!;
                  }),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ButtonSelected(
                  onPressed: () => Navigator.pop(context, initialGender),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
