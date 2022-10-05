class AlertModel {
  String? id;
  String notificationMethod;
  String currency;
  String isAboveNotBelow;
  double price;
  AlertModel({
    required this.notificationMethod,
    required this.currency,
    required this.isAboveNotBelow,
    required this.price,
  });
}
