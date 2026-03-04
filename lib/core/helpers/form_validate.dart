import 'package:spot/core/utils/text_validate_manager.dart';

class FormValidate {
  final bool isSubmitted;

  FormValidate({required this.isSubmitted});

  final emailRegExp = RegExp(TextValidateManager.emailRegExp);
  final fullNameRegExp = RegExp(TextValidateManager.fullNameRegExp);
  final phoneRegExp = RegExp(TextValidateManager.phoneFormat);

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

  String? validateRequired(String? value) {
    if (value == null || value.trim().isEmpty) {
      return isSubmitted ? TextValidateManager.fieldIsRequired : null;
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (validateRequired(value) != null) {
      return validateRequired(value);
    }

    if (!emailRegExp.hasMatch(value!.trim())) {
      return TextValidateManager.validEmailAddress;
    }

    return null;
  }

  String? validateFullName(String? value) {
    if (validateRequired(value) != null) {
      return validateRequired(value);
    }

    if (!fullNameRegExp.hasMatch(value!.trim())) {
      return TextValidateManager.invalidFullName;
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (validateRequired(value) != null) {
      return TextValidateManager.requiredPhone;
    }

    if (!phoneRegExp.hasMatch(value!.trim())) {
      return TextValidateManager.invalidPhoneFormat;
    }

    if (value.trim().length < 11) {
      return TextValidateManager.phoneTooShort;
    }

    return null;
  }

  String? validateUsername(String? value) {
    if (validateRequired(value) != null) {
      return validateRequired(value);
    }

    if (value!.trim().length < 4) {
      return TextValidateManager.usernameTooShort;
    }

    if (value.contains(" ")) {
      return TextValidateManager.usernameNoSpaces;
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (validateRequired(value) != null) {
      return validateRequired(value);
    }

    if (!passwordLeastLowerCaseLetter.hasMatch(value!)) {
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
}
