class UserModel {
  final String fullName;
  final String email;
  final bool rememberMe;
  final String? dateOfBirth;
  final String? myLocation;

  UserModel({
    required this.fullName,
    required this.email,
    this.rememberMe = false,
    this.dateOfBirth,
    this.myLocation,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullName: map['full_name'] ?? '',
      email: map['email'] ?? '',
      rememberMe: map['remember_me'] ?? false,
      dateOfBirth: map['date_of_birth'] ?? '',
      myLocation: map['my_location'] ?? 'Location not set.',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'full_name': fullName,
      'email': email,
      'remember_me': rememberMe,
      'date_of_birth': dateOfBirth,
      'my_location': myLocation,
    };
  }
}
