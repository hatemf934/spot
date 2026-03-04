class TextValidateManager {
  TextValidateManager._();

  static String emailRegExp = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
  static String passwordLeastLowerCaseLetter = r'(?=.*[a-z])';
  static String passwordLeastDigit = r'(?=.*\d)';
  static String passwordLeastOneCharacter = r'(?=.*[@$!%*?&])';
  static String passwordLeastEightNumber = r'.{8,}';
  static String phoneFormat = r'^\d+$';

  static const String fullNameRegExp =
      r'^([a-zA-Z\u0600-\u06FF]{2,}\s){2,}[a-zA-Z\u0600-\u06FF]{2,}$';

  static String fieldIsRequired = "This field is required";
  static String validEmailAddress = "Enter a valid email address";
  static String passwordFromAtoZ =
      "Password must contain at least one lowercase letter [a-z]";
  static String passwordSpicailCharacter =
      "Password must contain at least one special character";
  static String passwordLeastNumber =
      "Password must contain at least one number";
  static String passwordLeastAt8Number =
      "Password must be at least 8 characters long";
  static String pleaseSelectDataOfBrith = "Please select your date of birth";
  static String phoneTooShort = "Phone number is too short";
  static String invalidPhoneFormat = "Please enter digits only";
  static String requiredPhone = "Please enter your phone number";
  static String invalidFullName = "Full name must contain at least 3 words";
  static String passwordsNotMatch = "Passwords do not match";
  static String pleaseEnterNumber = "Please enter numbers only";
  static String usernameTooShort = "Username must be at least 4 characters";

  static String usernameNoSpaces = "Username must not contain spaces";
}
