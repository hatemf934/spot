class UserModel {
  final String fullName;
  final String userName;
  final String phone;
  final String email;
  final String password;
  final String dateOfBirth;
  final String gender;
  final String uId;

  UserModel({
    required this.fullName,
    required this.userName,
    required this.phone,
    required this.email,
    required this.password,
    required this.dateOfBirth,
    required this.gender,
    required this.uId,
  });
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'userName': userName,
      'phone': phone,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
      'uId': uId,
    };
  }
}
