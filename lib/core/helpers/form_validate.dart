import 'package:spot/core/utils/text_validate_manager.dart';

class FormValidate {
  final bool isSubmitted;

  FormValidate({required this.isSubmitted});

  final emailRegExp = RegExp(TextValidateManager.emailRegExp);
  final fullNameRegExp = RegExp(TextValidateManager.fullNameRegExp);
  final passwordLeastLowerCaseLetter = RegExp(
    TextValidateManager.passwordLeastLowerCaseLetter,
  );
  final passwordLeastDigit = RegExp(TextValidateManager.passwordLeastDigit);
  final passwordLeastOneCharacter = RegExp(
    TextValidateManager.passwordLeastOneCharacter,
  );
  final passwordLeastEightNumber = RegExp(
    TextValidateManager.passwordLeastEightNumber,
  );
  String? validateRequired(String? value, String validateText) {
    if (value == null || value.trim().isEmpty) {
      return isSubmitted ? validateText : null;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextValidateManager.emailRequired;
    }
    if (!emailRegExp.hasMatch(value.trim())) {
      return TextValidateManager.validEmailAddress;
    }

    return null;
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextValidateManager.fullNameRequired;
    }

    if (!fullNameRegExp.hasMatch(value.trim())) {
      return TextValidateManager.invalidFullName;
    }

    return null;
  }

  String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextValidateManager.usernameRequired;
    }

    if (value.trim().length < 4) {
      return TextValidateManager.usernameTooShort;
    }

    if (value.contains(" ")) {
      return TextValidateManager.usernameNoSpaces;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return TextValidateManager.passwordRequired;
    }

    if (!passwordLeastLowerCaseLetter.hasMatch(value)) {
      return TextValidateManager.passwordFromAtoZ;
    }

    if (!passwordLeastOneCharacter.hasMatch(value)) {
      return TextValidateManager.passwordSpicailCharacter;
    }

    if (!passwordLeastDigit.hasMatch(value)) {
      return TextValidateManager.passwordLeastNumber;
    }

    if (!passwordLeastEightNumber.hasMatch(value)) {
      return TextValidateManager.passwordLeastAt8Number;
    }

    return null;
  }

  String? validateConfirmPassword(String? value, String originalPassword) {
    if (value == null || value.trim().isEmpty) {
      return TextValidateManager.passwordRequired;
    }

    if (value != originalPassword) {
      return TextValidateManager.passwordsNotMatch;
    }

    return null;
  }

  //************phone validate for future*************//
  //   final phoneRegExp = RegExp(TextValidateManager.phoneFormat);
  // String? validatePhone(String? value) {
  //    if (value == null || value.trim().isEmpty) {
  //   return TextValidateManager.passwordRequired;
  // }

  //   if (!phoneRegExp.hasMatch(value!.trim())) {
  //     return TextValidateManager.invalidPhoneFormat;
  //   }

  //   if (value.trim().length < 11) {
  //     return TextValidateManager.phoneTooShort;
  //   }

  //   return null;
  // }
}
