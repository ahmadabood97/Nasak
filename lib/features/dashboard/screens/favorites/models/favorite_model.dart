class FavoriteResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  FavoriteResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  List<Items>? items;

  Result({this.items});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  String? id;
  String? userId;
  String? serviceProviderId;
  dynamic productGuid;
  AppServiceProvider? appServiceProvider;
  dynamic customer;

  Items(
      {this.id,
      this.userId,
      this.serviceProviderId,
      this.productGuid,
      this.appServiceProvider,
      this.customer});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_Id'];
    serviceProviderId = json['serviceProvider_Id'];
    productGuid = json['productGuid'];
    appServiceProvider = json['appServiceProvider'] != null
        ? AppServiceProvider.fromJson(json['appServiceProvider'])
        : null;
    customer = json['customer'];
  }
}

class AppServiceProvider {
  String? appServiceGuid;
  String? name;
  String? shortDesc;
  String? desc;
  String? normalizeLocation;
  dynamic serviceProvLogo;
  dynamic serviceProvBackImg;
  String? deliveryDurationNormalized;
  String? contactPrimaryPhone;
  String? contactSecPhone;
  String? contactAddress;
  String? supportPhone;
  String? adminfName;
  String? adminphone;
  int? approvedRatingSum;
  int? approvedTotalReviews;
  bool? isPickupAvailable;
  bool? showServiceProvider;
  String? countryGUID;
  String? cityGUID;
  String? regionGUID;
  dynamic pCountryent;
  dynamic pCityent;
  dynamic pRegionent;
  dynamic serive;
  dynamic spcateogires;
  String? locLat;
  String? locLong;
  String? id;
  dynamic createdBy;
  String? createdOnUtc;
  dynamic lastModifiedBy;
  dynamic lastModifiedOnUtc;
  dynamic ipAddress;
  bool? isDeleted;

  AppServiceProvider(
      {this.appServiceGuid,
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
      this.adminfName,
      this.adminphone,
      this.approvedRatingSum,
      this.approvedTotalReviews,
      this.isPickupAvailable,
      this.showServiceProvider,
      this.countryGUID,
      this.cityGUID,
      this.regionGUID,
      this.pCountryent,
      this.pCityent,
      this.pRegionent,
      this.serive,
      this.spcateogires,
      this.locLat,
      this.locLong,
      this.id,
      this.createdBy,
      this.createdOnUtc,
      this.lastModifiedBy,
      this.lastModifiedOnUtc,
      this.ipAddress,
      this.isDeleted});

  AppServiceProvider.fromJson(Map<String, dynamic> json) {
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
    adminfName = json['adminfName'];
    adminphone = json['adminphone'];
    approvedRatingSum = json['approvedRatingSum'];
    approvedTotalReviews = json['approvedTotalReviews'];
    isPickupAvailable = json['isPickupAvailable'];
    showServiceProvider = json['showServiceProvider'];
    countryGUID = json['country_GUID'];
    cityGUID = json['city_GUID'];
    regionGUID = json['region_GUID'];
    pCountryent = json['pCountryent'];
    pCityent = json['pCityent'];
    pRegionent = json['pRegionent'];
    serive = json['serive'];
    spcateogires = json['spcateogires'];
    locLat = json['locLat'];
    locLong = json['locLong'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdOnUtc = json['createdOnUtc'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOnUtc = json['lastModifiedOnUtc'];
    ipAddress = json['ipAddress'];
    isDeleted = json['isDeleted'];
  }
}
