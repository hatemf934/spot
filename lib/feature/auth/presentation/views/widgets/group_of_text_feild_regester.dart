import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spot/core/utils/height_manger.dart';
import 'package:spot/core/helpers/form_validate.dart';
import 'package:spot/core/utils/text_manager.dart';
import 'package:spot/feature/auth/presentation/bloc/login/user_cubit.dart';
import 'package:spot/feature/auth/presentation/views/widgets/custom_text_from_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/date_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/gender_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/password_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/phone_text_feild.dart';
import 'package:spot/feature/auth/presentation/views/widgets/user_name_text_feild.dart';

class GroupOfTextFeildRegester extends StatelessWidget {
  const GroupOfTextFeildRegester({super.key, required this.isSubmitted});
  final bool isSubmitted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        UserNameTextFeild(
          userNameController: context.read<UserCubit>().signUpUserName,
          fullNameController: context.read<UserCubit>().signUpFullName,
          isSubmitted: isSubmitted,
        ),
        SizedBox(height: HeightManager.h12),
        PhoneTextFeild(
          phoneController: context.read<UserCubit>().signUpPhoneNumber,
        ),
        SizedBox(height: HeightManager.h12),
        CustomTextFromFeild(
          controller: context.read<UserCubit>().signUpEmail,
          iconData: Icons.email,
          validator: (value) =>
              FormValidate(isSubmitted: isSubmitted).validateEmail(value),
          text: TextManager.emailOptional,
        ),
        SizedBox(height: HeightManager.h12),
        DateTextFeild(
          dateController: context.read<UserCubit>().signUpDateBrith,
          isSubmitted: isSubmitted,
        ),
        SizedBox(height: HeightManager.h12),
        GenderTextFeild(
          genderController: context.read<UserCubit>().signUpGender,
          isSubmitted: isSubmitted,
        ),
        SizedBox(height: HeightManager.h12),
        PasswordTextFeild(
          passwordController: context.read<UserCubit>().signUpPassword,
          hintPassword: TextManager.password,
          hintConfirmPassword: TextManager.confirmPassword,
          isSubmitted: isSubmitted,
        ),
      ],
    );
  }
}
