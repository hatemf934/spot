import 'package:flutter/material.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class GroupOfTextFeildLogin extends StatelessWidget {
  const GroupOfTextFeildLogin({super.key, required this.isSubmitted});
  final bool isSubmitted;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: HeightManager.h32),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.phoneOrUserName,
        ),
        const SizedBox(height: HeightManager.h16),
        CustomTextFromFeild(
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateRequired(value),
          text: TextManager.password,
        ),
      ],
    );
  }
}
