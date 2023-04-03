class OffersResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  OffersResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  OffersResponseModel.fromJson(Map<String, dynamic> json) {
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
  String? serviceProviderGuid;
  String? appServiceGuid;
  String? specialOfferImg;
  String? specialOfferTitle;
  String? specialOfferDesc;
  String? totalSpecialOfferPrice;
  int? displayNo;
  bool? isActive;
  dynamic sProivderent;
  dynamic specialofferProducts;
  dynamic appServiceent;

  Items(
      {this.id,
      this.serviceProviderGuid,
      this.appServiceGuid,
      this.specialOfferImg,
      this.specialOfferTitle,
      this.specialOfferDesc,
      this.totalSpecialOfferPrice,
      this.displayNo,
      this.isActive,
      this.sProivderent,
      this.specialofferProducts,
      this.appServiceent});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderGuid = json['serviceProviderGuid'];
    appServiceGuid = json['appServiceGuid'];
    specialOfferImg = json['specialOfferImg'];
    specialOfferTitle = json['specialOfferTitle'];
    specialOfferDesc = json['specialOfferDesc'];
    totalSpecialOfferPrice = json['totalSpecialOfferPrice'];
    displayNo = json['displayNo'];
    isActive = json['isActive'];
    sProivderent = json['sProivderent'];
    specialofferProducts = json['specialofferProducts'];
    appServiceent = json['appServiceent'];
  }
}
