class OrderResponseModel {
  String? appVersion;
  String? apiVersion;
  int? statusCode;
  String? errorMessage;
  Result? result;

  OrderResponseModel(
      {this.appVersion,
      this.apiVersion,
      this.statusCode,
      this.errorMessage,
      this.result});

  OrderResponseModel.fromJson(Map<String, dynamic> json) {
    appVersion = json['appVersion'];
    apiVersion = json['apiVersion'];
    statusCode = json['statusCode'];
    errorMessage = json['errorMessage'];
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['appVersion'] = appVersion;
    data['apiVersion'] = apiVersion;
    data['statusCode'] = statusCode;
    data['errorMessage'] = errorMessage;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class Result {
  List<Order>? items;

  Result({this.items});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Order>[];
      json['items'].forEach((v) {
        items!.add(Order.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Order {
  String? id;
  String? serviceProviderName;
  String? serviceProiderGuid;
  String? currencyId;
  String? currencySymbol;
  bool? isConfirmed;
  bool? ispickupOrder;
  String? customOrderNumber;
  String? customOrderDateofReceiptNumber;
  String? customOrderFinalDeliveryNumber;
  dynamic billingAddressGuid;
  dynamic pickupAddressGuid;
  String? shippingAddressGuid;
  String? customerGuid;
  bool? pickupInStore;
  int? orderStatusId;
  String? orderStatusName;
  int? shippingStatusId;
  int? paymentStatusId;
  String? paymentStatusName;
  dynamic paymentMethodSystemName;
  String? customerCurrencyCode;
  double? currencyRate;
  dynamic orderSubTotalDiscount;
  dynamic orderShippingFees;
  dynamic paymentMethodAdditionalFees;
  String? orderTotal;
  dynamic paidDateUtc;
  int? shippingMethod;
  bool? deleted;
  String? createdOnUtc;
  String? orderDeliveryDate;
  String? orderDeliveryTime;
  String? paymentMethodGuid;
  String? paymentMethodName;
  dynamic orderItems;

  Order(
      {this.id,
      this.serviceProviderName,
      this.serviceProiderGuid,
      this.currencyId,
      this.currencySymbol,
      this.isConfirmed,
      this.ispickupOrder,
      this.customOrderNumber,
      this.customOrderDateofReceiptNumber,
      this.customOrderFinalDeliveryNumber,
      this.billingAddressGuid,
      this.pickupAddressGuid,
      this.shippingAddressGuid,
      this.customerGuid,
      this.pickupInStore,
      this.orderStatusId,
      this.orderStatusName,
      this.shippingStatusId,
      this.paymentStatusId,
      this.paymentStatusName,
      this.paymentMethodSystemName,
      this.customerCurrencyCode,
      this.currencyRate,
      this.orderSubTotalDiscount,
      this.orderShippingFees,
      this.paymentMethodAdditionalFees,
      this.orderTotal,
      this.paidDateUtc,
      this.shippingMethod,
      this.deleted,
      this.createdOnUtc,
      this.orderDeliveryDate,
      this.orderDeliveryTime,
      this.paymentMethodGuid,
      this.paymentMethodName,
      this.orderItems});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceProviderName = json['serviceProviderName'];
    serviceProiderGuid = json['serviceProiderGuid'];
    currencyId = json['currency_Id'];
    currencySymbol = json['currencySymbol'];
    isConfirmed = json['isConfirmed'];
    ispickupOrder = json['ispickupOrder'];
    customOrderNumber = json['customOrderNumber'];
    customOrderDateofReceiptNumber = json['customOrderDateofReceiptNumber'];
    customOrderFinalDeliveryNumber = json['customOrderFinalDeliveryNumber'];
    billingAddressGuid = json['billingAddressGuid'];
    pickupAddressGuid = json['pickupAddressGuid'];
    shippingAddressGuid = json['shippingAddressGuid'];
    customerGuid = json['customerGuid'];
    pickupInStore = json['pickupInStore'];
    orderStatusId = json['orderStatusId'];
    orderStatusName = json['orderStatusName'];
    shippingStatusId = json['shippingStatusId'];
    paymentStatusId = json['paymentStatusId'];
    paymentStatusName = json['paymentStatusName'];
    paymentMethodSystemName = json['paymentMethodSystemName'];
    customerCurrencyCode = json['customerCurrencyCode'];
    currencyRate = json['currencyRate'].toDouble();
    orderSubTotalDiscount = json['orderSubTotalDiscount'];
    orderShippingFees = json['orderShippingFees'];
    paymentMethodAdditionalFees = json['paymentMethodAdditionalFees'];
    orderTotal = json['orderTotal'];
    paidDateUtc = json['paidDateUtc'];
    shippingMethod = json['shippingMethod'];
    deleted = json['deleted'];
    createdOnUtc = json['createdOnUtc'];
    orderDeliveryDate = json['orderDeliveryDate'];
    orderDeliveryTime = json['orderDeliveryTime'];
    paymentMethodGuid = json['paymentMethodGuid'];
    paymentMethodName = json['paymentMethodName'];
    orderItems = json['orderItems'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['serviceProviderName'] = serviceProviderName;
    data['serviceProiderGuid'] = serviceProiderGuid;
    data['currency_Id'] = currencyId;
    data['currencySymbol'] = currencySymbol;
    data['isConfirmed'] = isConfirmed;
    data['ispickupOrder'] = ispickupOrder;
    data['customOrderNumber'] = customOrderNumber;
    data['customOrderDateofReceiptNumber'] = customOrderDateofReceiptNumber;
    data['customOrderFinalDeliveryNumber'] = customOrderFinalDeliveryNumber;
    data['billingAddressGuid'] = billingAddressGuid;
    data['pickupAddressGuid'] = pickupAddressGuid;
    data['shippingAddressGuid'] = shippingAddressGuid;
    data['customerGuid'] = customerGuid;
    data['pickupInStore'] = pickupInStore;
    data['orderStatusId'] = orderStatusId;
    data['orderStatusName'] = orderStatusName;
    data['shippingStatusId'] = shippingStatusId;
    data['paymentStatusId'] = paymentStatusId;
    data['paymentStatusName'] = paymentStatusName;
    data['paymentMethodSystemName'] = paymentMethodSystemName;
    data['customerCurrencyCode'] = customerCurrencyCode;
    data['currencyRate'] = currencyRate;
    data['orderSubTotalDiscount'] = orderSubTotalDiscount;
    data['orderShippingFees'] = orderShippingFees;
    data['paymentMethodAdditionalFees'] = paymentMethodAdditionalFees;
    data['orderTotal'] = orderTotal;
    data['paidDateUtc'] = paidDateUtc;
    data['shippingMethod'] = shippingMethod;
    data['deleted'] = deleted;
    data['createdOnUtc'] = createdOnUtc;
    data['orderDeliveryDate'] = orderDeliveryDate;
    data['orderDeliveryTime'] = orderDeliveryTime;
    data['paymentMethodGuid'] = paymentMethodGuid;
    data['paymentMethodName'] = paymentMethodName;
    data['orderItems'] = orderItems;
    return data;
  }
}
