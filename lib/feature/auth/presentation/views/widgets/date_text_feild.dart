import 'package:flutter/material.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/text_validate_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/show_date_button_sheet.dart';

class DateTextFeild extends StatefulWidget {
  const DateTextFeild({super.key, required this.isSubmitted});
  final bool isSubmitted;
  @override
  State<DateTextFeild> createState() => _DateTextFeildState();
}

class _DateTextFeildState extends State<DateTextFeild> {
  final TextEditingController birthdayController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    birthdayController.dispose();
  }

  DateTime selectedBirthDate = DateTime(2004, 3, 16);
  @override
  Widget build(BuildContext context) {
    return CustomTextFromFeild(
      controller: birthdayController,
      readOnly: true,
      onPressedIcons: () async {
        final pickedDate = await showDateButtonSheet(
          context,
          selectedBirthDate,
        );
        if (pickedDate != null) {
          setState(() {
            selectedBirthDate = pickedDate;
            birthdayController.text =
                "${pickedDate.year}-${pickedDate.month}-${pickedDate.day}";
          });
        }
      },
      iconData: Icons.calendar_month_rounded,
      validator: (value) => FormValidate(
        isSubmitted: widget.isSubmitted,
      ).validateRequired(value, TextValidateManager.dateRequired),
      text: TextManager.dateOfBirth,
    );
  }
}
