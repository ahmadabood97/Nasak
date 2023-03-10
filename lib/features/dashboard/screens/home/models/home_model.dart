class HomeResponse {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  HomeResponse(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }
}

class Result {
  List<MainBanners>? mainBanners;
  List<AppServices>? appServices;
  List<MainCategories>? mainCategories;
  List<HomeScreenWidgets>? homeScreenWidgets;
  List<Currencies>? currencies;
  List<DeliveryLocations>? deliveryLocations;

  Result(
      {this.mainBanners,
      this.appServices,
      this.mainCategories,
      this.homeScreenWidgets,
      this.currencies,
      this.deliveryLocations});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['mainBanners'] != null) {
      mainBanners = <MainBanners>[];
      json['mainBanners'].forEach((v) {
        mainBanners!.add(MainBanners.fromJson(v));
      });
    }
    if (json['appServices'] != null) {
      appServices = <AppServices>[];
      json['appServices'].forEach((v) {
        appServices!.add(AppServices.fromJson(v));
      });
    }
    if (json['mainCategories'] != null) {
      mainCategories = <MainCategories>[];
      json['mainCategories'].forEach((v) {
        mainCategories!.add(MainCategories.fromJson(v));
      });
    }
    if (json['homeScreenWidgets'] != null) {
      homeScreenWidgets = <HomeScreenWidgets>[];
      json['homeScreenWidgets'].forEach((v) {
        homeScreenWidgets!.add(HomeScreenWidgets.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currencies.fromJson(v));
      });
    }
    if (json['deliveryLocations'] != null) {
      deliveryLocations = <DeliveryLocations>[];
      json['deliveryLocations'].forEach((v) {
        deliveryLocations!.add(DeliveryLocations.fromJson(v));
      });
    }
  }
}

class MainBanners {
  String? id;
  String? appServiceProviderGuid;
  String? url;
  String? img;
  String? desc;
  int? bannerType;
  String? sourceGuid;

  MainBanners(
      {this.id,
      this.appServiceProviderGuid,
      this.url,
      this.img,
      this.desc,
      this.bannerType,
      this.sourceGuid});

  MainBanners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appServiceProviderGuid = json['appServiceProviderGuid'];
    url = json['url'];
    img = json['img'];
    desc = json['desc'];
    bannerType = json['bannerType'];
    sourceGuid = json['sourceGuid'];
  }
}

class AppServices {
  String? id;
  String? displayname;
  dynamic serviceIco;
  dynamic serviceBackimg;
  bool? showCategories;
  bool? showServiceProviders;

  AppServices(
      {this.id,
      this.displayname,
      this.serviceIco,
      this.serviceBackimg,
      this.showCategories,
      this.showServiceProviders});

  AppServices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayname = json['displayname'];
    serviceIco = json['serviceIco'];
    serviceBackimg = json['serviceBackimg'];
    showCategories = json['showCategories'];
    showServiceProviders = json['showServiceProviders'];
  }
}

class MainCategories {
  String? id;
  String? name;
  int? displayOrder;
  dynamic catImgUrl;
  dynamic catCoverBackImgUrl;
  dynamic subCats;
  String? appServiceGuid;
  dynamic appservice;
  dynamic parent;

  MainCategories(
      {this.id,
      this.name,
      this.displayOrder,
      this.catImgUrl,
      this.catCoverBackImgUrl,
      this.subCats,
      this.appServiceGuid,
      this.appservice,
      this.parent});

  MainCategories.fromJson(Map<String, dynamic> json) {
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

class HomeScreenWidgets {
  int? widgetType;
  String? title;
  dynamic cats;
  dynamic banners;
  List<Products>? products;
  dynamic offers;
  List<Discounts>? discounts;
  List<Brands>? brands;

  HomeScreenWidgets(
      {this.widgetType,
      this.title,
      this.cats,
      this.banners,
      this.products,
      this.offers,
      this.discounts,
      this.brands});

  HomeScreenWidgets.fromJson(Map<String, dynamic> json) {
    widgetType = json['widgetType'];
    title = json['title'];
    cats = json['cats'];
    banners = json['banners'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    offers = json['offers'];
    if (json['discounts'] != null) {
      discounts = <Discounts>[];
      json['discounts'].forEach((v) {
        discounts!.add(Discounts.fromJson(v));
      });
    }
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands!.add(Brands.fromJson(v));
      });
    }
  }
}

class Products {
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
  String? categoryName;
  String? categoryGuid;
  String? brandName;
  String? productimgurl;

  Products(
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

  Products.fromJson(Map<String, dynamic> json) {
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

class Discounts {
  String? id;
  String? name;
  String? couponCode;
  int? discountTypeId;
  bool? usePercentage;
  dynamic discountPercentage;
  String? discountAmount;
  String? discountImgurl;

  Discounts(
      {this.id,
      this.name,
      this.couponCode,
      this.discountTypeId,
      this.usePercentage,
      this.discountPercentage,
      this.discountAmount,
      this.discountImgurl});

  Discounts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    couponCode = json['couponCode'];
    discountTypeId = json['discountTypeId'];
    usePercentage = json['usePercentage'];
    discountPercentage = json['discountPercentage'];
    discountAmount = json['discountAmount'];
    discountImgurl = json['discountImgurl'];
  }
}

class Brands {
  String? id;
  String? brandName;
  String? brandShortDesc;
  String? brandDesc;

  Brands({this.id, this.brandName, this.brandShortDesc, this.brandDesc});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
    brandShortDesc = json['brandShortDesc'];
    brandDesc = json['brandDesc'];
  }
}

class Currencies {
  String? id;
  String? name;
  String? displayName;
  bool? availabe;
  String? rate;
  String? symbol;

  Currencies(
      {this.id,
      this.name,
      this.displayName,
      this.availabe,
      this.rate,
      this.symbol});

  Currencies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    displayName = json['displayName'];
    availabe = json['availabe'];
    rate = json['rate'];
    symbol = json['symbol'];
  }
}

class DeliveryLocations {
  String? deliveryRegionName;
  String? id;

  DeliveryLocations({this.deliveryRegionName, this.id});

  DeliveryLocations.fromJson(Map<String, dynamic> json) {
    deliveryRegionName = json['deliveryRegionName'];
    id = json['id'];
  }
}
