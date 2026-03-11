class TextValidateManager {
  TextValidateManager._();

  static String emailRegExp = r'^[a-zA-Z0-9._%+-]+@gmail\.com$';
  static String passwordLeastLowerCaseLetter = r'(?=.*[a-z])';
  static String passwordLeastDigit = r'(?=.*\d)';
  static String passwordLeastOneCharacter = r'(?=.*[@$!%*?&])';
  static String passwordLeastEightNumber = r'.{8,}';
  static String usernameRegex = r'^[a-zA-Z0-9_]+$';

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
  static String invalidFullName = "Full name must contain at least 3 words";
  static String passwordsNotMatch = "Passwords do not match";
  static String usernameTooShort = "Username must be at least 4 characters";
  static String usernameNoSpaces = "Username must not contain spaces";
  static String usernameInvalid = "Use only letters, numbers, or underscores";

  static String emailRequired = "Email address is required";
  static String passwordRequired = "Password is required";
  static String genderRequired = "Please select your gender";
  static String dateRequired = "Please select your date of birth";
  static String fullNameRequired = "Full name is required";
  static String usernameRequired = "Username is required";
  static String usernameAndPhoneRequired =
      "Phone Number / User Name is required";
}
