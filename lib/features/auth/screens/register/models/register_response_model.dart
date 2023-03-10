class RegisterResponseModel {
  String? id;
  String? firstName;
  String? lastName;
  dynamic userName;
  dynamic password;
  dynamic primaryPhoneNum;
  dynamic secondPhoneNum;
  dynamic cusCountryent;
  dynamic cusCityent;
  dynamic cusRegionent;
  dynamic principal;
  String? authToken;

  RegisterResponseModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.userName,
      this.password,
      this.primaryPhoneNum,
      this.secondPhoneNum,
      this.cusCountryent,
      this.cusCityent,
      this.cusRegionent,
      this.principal,
      this.authToken});

  RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    password = json['password'];
    primaryPhoneNum = json['primaryPhoneNum'];
    secondPhoneNum = json['secondPhoneNum'];
    cusCountryent = json['cus_countryent'];
    cusCityent = json['cus_cityent'];
    cusRegionent = json['cus_regionent'];
    principal = json['principal'];
    authToken = json['authToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['password'] = password;
    data['primaryPhoneNum'] = primaryPhoneNum;
    data['secondPhoneNum'] = secondPhoneNum;
    data['cus_countryent'] = cusCountryent;
    data['cus_cityent'] = cusCityent;
    data['cus_regionent'] = cusRegionent;
    data['principal'] = principal;
    data['authToken'] = authToken;
    return data;
  }
}
