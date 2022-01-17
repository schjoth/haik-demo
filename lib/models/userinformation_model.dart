class UserInformationModel {
  final String name;
  final String birthday;

  UserInformationModel({required this.name, required this.birthday});

  factory UserInformationModel.fromMap(Map data) {
    return UserInformationModel(
      name: data["name"] ?? "",
      birthday: data["birthday"] ?? "",
    );
  }
}
