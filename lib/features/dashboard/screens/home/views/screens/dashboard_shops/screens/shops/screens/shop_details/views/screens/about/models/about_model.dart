class AboutResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  AboutResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  AboutResponseModel.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  List<SpReviews>? spReviews;
  dynamic spDiscounts;
  List<SpOffers>? spOffers;
  TodayDeliveryPeroid? todayDeliveryPeroid;
  TodayDeliveryPeroid? tomorrowDeliveryPeroid;

  Result(
      {this.spReviews,
      this.spDiscounts,
      this.spOffers,
      this.todayDeliveryPeroid,
      this.tomorrowDeliveryPeroid});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['spReviews'] != null) {
      spReviews = <SpReviews>[];
      json['spReviews'].forEach((v) {
        spReviews!.add(SpReviews.fromJson(v));
      });
    }
    spDiscounts = json['spDiscounts'];
    if (json['spOffers'] != null) {
      spOffers = <SpOffers>[];
      json['spOffers'].forEach((v) {
        spOffers!.add(SpOffers.fromJson(v));
      });
    }
    todayDeliveryPeroid = json['todayDeliveryPeroid'] != null
        ? TodayDeliveryPeroid.fromJson(json['todayDeliveryPeroid'])
        : null;
    tomorrowDeliveryPeroid = json['tomorrowDeliveryPeroid'] != null
        ? TodayDeliveryPeroid.fromJson(json['tomorrowDeliveryPeroid'])
        : null;
  }
}

class SpReviews {
  String? id;
  dynamic productGuid;
  String? serviceProviderGuid;
  String? customerGuid;
  bool? isApproved;
  dynamic title;
  String? reviewText;
  dynamic replyText;
  dynamic serviceProviderRating;
  int? productRating;
  int? deliveryRating;
  int? helpfulYesTotal;
  int? helpfulNoTotal;
  String? createdOn;
  dynamic customerent;
  dynamic productent;
  dynamic serviceProviderent;

  SpReviews(
      {this.id,
      this.productGuid,
      this.serviceProviderGuid,
      this.customerGuid,
      this.isApproved,
      this.title,
      this.reviewText,
      this.replyText,
      this.serviceProviderRating,
      this.productRating,
      this.deliveryRating,
      this.helpfulYesTotal,
      this.helpfulNoTotal,
      this.createdOn,
      this.customerent,
      this.productent,
      this.serviceProviderent});

  SpReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productGuid = json['productGuid'];
    serviceProviderGuid = json['serviceProviderGuid'];
    customerGuid = json['customerGuid'];
    isApproved = json['isApproved'];
    title = json['title'];
    reviewText = json['reviewText'];
    replyText = json['replyText'];
    serviceProviderRating = json['serviceProviderRating'];
    productRating = json['productRating'];
    deliveryRating = json['deliveryRating'];
    helpfulYesTotal = json['helpfulYesTotal'];
    helpfulNoTotal = json['helpfulNoTotal'];
    createdOn = json['createdOn'];
    customerent = json['customerent'];
    productent = json['productent'];
    serviceProviderent = json['serviceProviderent'];
  }
}

class SpOffers {
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
  // List<Null>? specialofferProducts;
  dynamic appServiceent;

  SpOffers(
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
      // this.specialofferProducts,
      this.appServiceent});

  SpOffers.fromJson(Map<String, dynamic> json) {
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
    // if (json['specialofferProducts'] != null) {
    //   specialofferProducts = <Null>[];
    //   json['specialofferProducts'].forEach((v) {
    //     specialofferProducts!.add(Null.fromJson(v));
    //   });
    // }
    appServiceent = json['appServiceent'];
  }
}

class TodayDeliveryPeroid {
  String? periodName;
  String? serviceProviderGuid;
  dynamic categoryGuid;
  int? dayID;
  String? startHour;
  String? endHour;
  dynamic specificDate;
  bool? isWorkingDay;
  String? notes;
  int? displayorder;
  bool? isenabled;
  dynamic catent;
  dynamic serviceProviderent;
  String? id;
  dynamic createdBy;
  String? createdOnUtc;
  dynamic lastModifiedBy;
  dynamic lastModifiedOnUtc;
  dynamic ipAddress;
  bool? isDeleted;

  TodayDeliveryPeroid(
      {this.periodName,
      this.serviceProviderGuid,
      this.categoryGuid,
      this.dayID,
      this.startHour,
      this.endHour,
      this.specificDate,
      this.isWorkingDay,
      this.notes,
      this.displayorder,
      this.isenabled,
      this.catent,
      this.serviceProviderent,
      this.id,
      this.createdBy,
      this.createdOnUtc,
      this.lastModifiedBy,
      this.lastModifiedOnUtc,
      this.ipAddress,
      this.isDeleted});

  TodayDeliveryPeroid.fromJson(Map<String, dynamic> json) {
    periodName = json['periodName'];
    serviceProviderGuid = json['serviceProviderGuid'];
    categoryGuid = json['categoryGuid'];
    dayID = json['dayID'];
    startHour = json['startHour'];
    endHour = json['endHour'];
    specificDate = json['specificDate'];
    isWorkingDay = json['isWorkingDay'];
    notes = json['notes'];
    displayorder = json['displayorder'];
    isenabled = json['isenabled'];
    catent = json['catent'];
    serviceProviderent = json['serviceProviderent'];
    id = json['id'];
    createdBy = json['createdBy'];
    createdOnUtc = json['createdOnUtc'];
    lastModifiedBy = json['lastModifiedBy'];
    lastModifiedOnUtc = json['lastModifiedOnUtc'];
    ipAddress = json['ipAddress'];
    isDeleted = json['isDeleted'];
  }
}
