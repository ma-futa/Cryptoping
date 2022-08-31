class AlertModel {
  String notificationMethode;
  String currency;
  bool isAboveNotBelow;
  double price;
  String platform;
  AlertModel({
    required this.notificationMethode,
    required this.currency,
    required this.isAboveNotBelow,
    required this.price,
    required this.platform,
  });
}
