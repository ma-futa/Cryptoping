class AlertModel {
  String? id;
  String notificationMethod;
  String currency;
  String isAboveNotBelow;
  double price;
  String platform;
  AlertModel({
    required this.notificationMethod,
    required this.currency,
    required this.isAboveNotBelow,
    required this.price,
    required this.platform,
  });
}
