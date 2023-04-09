class ShopDetailsResponse {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  ShopDetailsResponse(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  ShopDetailsResponse.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class ProductDetails {
  int? attrType;
  bool? affectPrice;
  bool? isFixedPrice;
  bool? isExtraPrice;
  String? groupName;
  String? optionName;
  String? groupguid;
  String? optionguid;
  String? optionPriceAdj;
  bool? isavaliable;
  bool isSelected = false;

  ProductDetails(
      {required this.attrType,
      required this.affectPrice,
      required this.isFixedPrice,
      required this.isExtraPrice,
      required this.groupName,
      required this.optionName,
      required this.groupguid,
      required this.optionguid,
      required this.isavaliable,
      required this.optionPriceAdj});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    attrType = json['AttrType'];
    affectPrice = json['AffectPrice'];
    isFixedPrice = json['isFixedPrice'];
    isExtraPrice = json['isExtraPrice'];
    groupName = json['GroupName'];
    optionName = json['OptionName'];
    groupguid = json['Groupguid'];
    optionguid = json['Optionguid'];
    optionPriceAdj = json['optionPriceAdj'];
    isavaliable = json['isavaliable'];
  }
}

class Result {
  SpModel? spModel;
  bool? isFav;
  List<SPcategories>? sPcategories;
  List<SpProducts>? spProducts;

  Result({this.spModel, this.sPcategories, this.spProducts});

  Result.fromJson(Map<String, dynamic> json) {
    spModel =
        json['spModel'] != null ? SpModel.fromJson(json['spModel']) : null;
    isFav = json['isFav'];
    if (json['sPcategories'] != null) {
      sPcategories = <SPcategories>[];
      json['sPcategories'].forEach((v) {
        sPcategories!.add(SPcategories.fromJson(v));
      });
    }
    if (json['spProducts'] != null) {
      spProducts = <SpProducts>[];
      json['spProducts'].forEach((v) {
        spProducts!.add(SpProducts.fromJson(v));
      });
    }
  }
}

class SpModel {
  String? id;
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
  bool? isPickupAvailable;
  int? approvedRatingSum;
  int? approvedTotalReviews;
  dynamic pCountryent;
  dynamic pCityent;
  dynamic pRegionent;
  dynamic serviceproviderCats;
  String? locLat;
  String? locLong;

  SpModel(
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

  SpModel.fromJson(Map<String, dynamic> json) {
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

class SPcategories {
  String? id;
  String? name;
  int? displayOrder;
  String? catImgUrl;
  String? catCoverBackImgUrl;
  dynamic subCats;
  String? appServiceGuid;
  dynamic appservice;
  dynamic parent;

  SPcategories(
      {this.id,
      this.name,
      this.displayOrder,
      this.catImgUrl,
      this.catCoverBackImgUrl,
      this.subCats,
      this.appServiceGuid,
      this.appservice,
      this.parent});

  SPcategories.fromJson(Map<String, dynamic> json) {
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

class SpProducts {
  String? id;
  String? name;
  dynamic displayOrder;
  String? shortDescription;
  String? fullHTMLDescription;
  bool? allowCustomerReviews;
  int? approvedRatingSum;
  int? approvedTotalReviews;
  bool? disableBuyButton;
  bool? disableWishlistButton;
  bool? markAsNew;
  String? price;
  dynamic oldPrice;
  dynamic foreignPrice;
  String? orderMinimumQuantity;
  String? orderMaximumQuantity;
  dynamic additionalShippingCharge;
  String? productAttAsJson;
  String? categoryName;
  String? categoryGuid;
  dynamic brandName;
  String? productimgurl;
  List<ProductDetails>? productDetails;
  List<List<ProductDetails>> extraList = [];
  List<String> extraHelpList = [];
  int quantityInCart = 1;
  int quantityToCart = 1;

  SpProducts(
      {this.id,
      this.name,
      this.displayOrder,
      this.shortDescription,
      this.fullHTMLDescription,
      this.allowCustomerReviews,
      this.approvedRatingSum,
      this.approvedTotalReviews,
      this.disableBuyButton,
      this.disableWishlistButton,
      this.markAsNew,
      this.price,
      this.oldPrice,
      this.foreignPrice,
      this.orderMinimumQuantity,
      this.orderMaximumQuantity,
      this.additionalShippingCharge,
      this.productAttAsJson,
      this.categoryName,
      this.categoryGuid,
      this.brandName,
      this.productimgurl});

  SpProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayOrder = json['displayOrder'];
    shortDescription = json['shortDescription'];
    fullHTMLDescription = json['fullHTMLDescription'];
    allowCustomerReviews = json['allowCustomerReviews'];
    approvedRatingSum = json['approvedRatingSum'];
    approvedTotalReviews = json['approvedTotalReviews'];
    disableBuyButton = json['disableBuyButton'];
    disableWishlistButton = json['disableWishlistButton'];
    markAsNew = json['markAsNew'];
    price = json['price'];
    oldPrice = json['oldPrice'];
    foreignPrice = json['foreignPrice'];
    orderMinimumQuantity = json['orderMinimumQuantity'];
    orderMaximumQuantity = json['orderMaximumQuantity'];
    additionalShippingCharge = json['additionalShippingCharge'];
    productAttAsJson = json['productAttAsJson'];
    categoryName = json['categoryName'];
    categoryGuid = json['categoryGuid'];
    brandName = json['brandName'];
    productimgurl = json['productimgurl'];
  }
}
