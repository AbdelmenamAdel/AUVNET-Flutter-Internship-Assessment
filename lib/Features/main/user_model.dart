class UserModel {
  String email;
  String fullName;
  String id;
  bool isAuthenticated;
  String profilePhoto;
  UserModel({
    required this.email,
    required this.fullName,
    required this.id,
    required this.profilePhoto,
    required this.isAuthenticated,
  });

  Map<String, dynamic> toMap() {
    return {
      'profilePhoto': profilePhoto,
      'email': email,
      'full_name': fullName,
      'id': id,
      'is_authenticated': isAuthenticated,
    };
  }

  factory UserModel.fromJson(json) {
    return UserModel(
      email: json['email'],
      fullName: json['full_name'],
      profilePhoto: json['profilePhoto'],
      id: json['id'],
      isAuthenticated: json['is_authenticated'],
    );
  }
}
