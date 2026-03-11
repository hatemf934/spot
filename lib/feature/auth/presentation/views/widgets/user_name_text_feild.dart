import 'package:flutter/material.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';

class UserNameTextFeild extends StatelessWidget {
  const UserNameTextFeild({
    super.key,
    required this.isSubmitted,
    required this.fullNameController,
    required this.userNameController,
  });
  final bool isSubmitted;
  final TextEditingController fullNameController;
  final TextEditingController userNameController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFromFeild(
          controller: fullNameController,
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateFullName(value),
          text: TextManager.fullName,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          controller: userNameController,
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateUsername(value),
          text: TextManager.userName,
        ),
      ],
    );
  }
}
