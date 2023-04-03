class CategoryDetailsResponse {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  CategoryDetailsResponse(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  CategoryDetailsResponse.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  List<SubCategories>? subCategories;
  List<CatProducts>? catProducts;

  Result({this.subCategories, this.catProducts});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories!.add(SubCategories.fromJson(v));
      });
    }
    if (json['catProducts'] != null) {
      catProducts = <CatProducts>[];
      json['catProducts'].forEach((v) {
        catProducts!.add(CatProducts.fromJson(v));
      });
    }
  }
}

class SubCategories {
  String? id;
  String? name;
  int? displayOrder;
  String? catImgUrl;
  String? catCoverBackImgUrl;
  dynamic subCats;
  String? appServiceGuid;
  dynamic appservice;
  dynamic parent;

  SubCategories(
      {this.id,
      this.name,
      this.displayOrder,
      this.catImgUrl,
      this.catCoverBackImgUrl,
      this.subCats,
      this.appServiceGuid,
      this.appservice,
      this.parent});

  SubCategories.fromJson(Map<String, dynamic> json) {
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

class CatProducts {
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
  dynamic orderMinimumQuantity;
  dynamic orderMaximumQuantity;
  dynamic additionalShippingCharge;
  dynamic productAttAsJson;
  dynamic categoryName;
  String? categoryGuid;
  dynamic brandName;
  dynamic productimgurl;

  CatProducts(
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

  CatProducts.fromJson(Map<String, dynamic> json) {
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
