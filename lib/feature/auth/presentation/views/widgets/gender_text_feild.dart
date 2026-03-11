import 'package:flutter/material.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/text_validate_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/show_gender_button_sheet.dart';

class GenderTextFeild extends StatefulWidget {
  const GenderTextFeild({
    super.key,
    required this.isSubmitted,
    required this.genderController,
  });
  final bool isSubmitted;
  final TextEditingController genderController;
  @override
  State<GenderTextFeild> createState() => _GenderTextFeildState();
}

class _GenderTextFeildState extends State<GenderTextFeild> {
  String selectedGender = TextManager.maleText;
  @override
  Widget build(BuildContext context) {
    return CustomTextFromFeild(
      readOnly: true,
      controller: widget.genderController,
      onPressedIcons: () async {
        final result = await showGenderButtonSheet(context, selectedGender);
        if (result != null) {
          selectedGender = result;
          setState(() {
            widget.genderController.text = selectedGender;
          });
        }
      },
      iconData: Icons.keyboard_arrow_down,
      validator: (value) => FormValidate(
        isSubmitted: widget.isSubmitted,
      ).validateRequired(value, TextValidateManager.genderRequired),
      text: TextManager.gender,
    );
  }
}
