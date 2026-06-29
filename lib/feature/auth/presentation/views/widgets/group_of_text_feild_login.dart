import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/core/utils/text_validate_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/login/user_cubit.dart';
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
          controller: context.read<UserCubit>().signInEmail,
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateEmail(value),
          text: TextManager.emailOptional,
        ),
        const SizedBox(height: HeightManager.h16),
        CustomTextFromFeild(
          controller: context.read<UserCubit>().signInPassword,
          validator: (value) => FormValidate(
            isSubmitted: isSubmitted,
          ).validateRequired(value, TextValidateManager.passwordRequired),
          text: TextManager.password,
          obscureText: true,
        ),
      ],
    );
  }
}
