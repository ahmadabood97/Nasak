class RegisterModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  String? primaryPhoneNum;
  String? countryGuid;
  String? cityGuid;
  String? regionGuid;
  bool? subscribeToNewsletter;

  RegisterModel(
      {this.firstName,
      this.lastName,
      this.userName,
      this.password,
      this.primaryPhoneNum,
      this.countryGuid,
      this.cityGuid,
      this.regionGuid,
      this.subscribeToNewsletter});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    password = json['password'];
    primaryPhoneNum = json['primaryPhoneNum'];
    countryGuid = json['countryGuid'];
    cityGuid = json['cityGuid'];
    regionGuid = json['regionGuid'];
    subscribeToNewsletter = json['subscribeToNewsletter'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['password'] = password;
    data['primaryPhoneNum'] = primaryPhoneNum;
    data['countryGuid'] = countryGuid;
    data['cityGuid'] = cityGuid;
    data['regionGuid'] = regionGuid;
    data['subscribeToNewsletter'] = subscribeToNewsletter;
    return data;
  }
}
