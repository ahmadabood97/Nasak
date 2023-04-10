import '../views/screens/dashboard_shops/screens/shops/screens/shop_details/models/shop_model.dart';

class AppServicesResponse {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  AppServicesResponse(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  AppServicesResponse.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  List<ServiceCategories>? serviceCategories;
  List<ServiceProviders>? serviceProviders;

  Result({this.serviceCategories, this.serviceProviders});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['serviceCategories'] != null) {
      serviceCategories = <ServiceCategories>[];
      json['serviceCategories'].forEach((v) {
        serviceCategories!.add(ServiceCategories.fromJson(v));
      });
    }
    if (json['serviceProviders'] != null) {
      serviceProviders = <ServiceProviders>[];
      json['serviceProviders'].forEach((v) {
        serviceProviders!.add(ServiceProviders.fromJson(v));
      });
    }
  }
}

class ServiceCategories {
  String? id;
  String? name;
  int? displayOrder;
  String? catImgUrl;
  String? catCoverBackImgUrl;
  dynamic subCats;
  String? appServiceGuid;
  dynamic appservice;
  dynamic parent;

  ServiceCategories(
      {this.id,
      this.name,
      this.displayOrder,
      this.catImgUrl,
      this.catCoverBackImgUrl,
      this.subCats,
      this.appServiceGuid,
      this.appservice,
      this.parent});

  ServiceCategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayOrder = json['displayOrder'];
    catImgUrl = json['catImgUrl'];
    catCoverBackImgUrl = json['catCoverBackImgUrl'];
    subCats = json['subCats'];
    appServiceGuid = json['appServiceGuid'];
    appservice = json['appservice'];
    parent = json['parent'];
  }
}

class ServiceProviders {
  String? id;
  String? appServiceGuid;
  String? name;
  String? shortDesc;
  String? desc;
  String? normalizeLocation;
  dynamic serviceProvLogo;
  String? serviceProvBackImg;
  String? deliveryDurationNormalized;
  String? contactPrimaryPhone;
  String? contactSecPhone;
  String? contactAddress;
  String? supportPhone;
  bool? isPickupAvailable;
  int? approvedRatingSum;
  int? approvedTotalReviews;
  dynamic pCountryent;
  dynamic pCityent;
  dynamic pRegionent;
  String? serviceproviderCats;
  String? locLat;
  String? locLong;
  int? index;
  List<SpProducts> cart = [];

  ServiceProviders(
      {this.id,
      this.appServiceGuid,
      this.name,
      this.shortDesc,
      this.desc,
      this.normalizeLocation,
      this.serviceProvLogo,
      this.serviceProvBackImg,
      this.deliveryDurationNormalized,
      this.contactPrimaryPhone,
      this.contactSecPhone,
      this.contactAddress,
      this.supportPhone,
      this.isPickupAvailable,
      this.approvedRatingSum,
      this.approvedTotalReviews,
      this.pCountryent,
      this.pCityent,
      this.pRegionent,
      this.serviceproviderCats,
      this.locLat,
      this.locLong});

  ServiceProviders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appServiceGuid = json['appServiceGuid'];
    name = json['name'];
    shortDesc = json['shortDesc'];
    desc = json['desc'];
    normalizeLocation = json['normalizeLocation'];
    serviceProvLogo = json['serviceProvLogo'];
    serviceProvBackImg = json['serviceProvBackImg'];
    deliveryDurationNormalized = json['deliveryDurationNormalized'];
    contactPrimaryPhone = json['contactPrimaryPhone'];
    contactSecPhone = json['contactSecPhone'];
    contactAddress = json['contactAddress'];
    supportPhone = json['supportPhone'];
    isPickupAvailable = json['isPickupAvailable'];
    approvedRatingSum = json['approvedRatingSum'];
    approvedTotalReviews = json['approvedTotalReviews'];
    pCountryent = json['pCountryent'];
    pCityent = json['pCityent'];
    pRegionent = json['pRegionent'];
    serviceproviderCats = json['serviceproviderCats'];
    locLat = json['locLat'];
    locLong = json['locLong'];
  }
}
