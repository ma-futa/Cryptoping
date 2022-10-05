import 'package:crypto_ping_v1/models/alert_model.dart';
import 'package:flutter/cupertino.dart';

class AlertProvider extends ChangeNotifier {
  AlertModel _alert = AlertModel(
      currency: 'BTC',
      isAboveNotBelow: 'above',
      notificationMethod: 'Email',
      price: 0.0);

  void setAlert(AlertModel alert) {
    _alert = alert;
    notifyListeners();
  }

  get getAlert => _alert;

  void setNotificationMethod(String val) {
    _alert.notificationMethod = val;
    notifyListeners();
  }

  void setCurrency(String val) {
    _alert.currency = val;
    notifyListeners();
  }

  void setIsAbove(String val) {
    _alert.isAboveNotBelow = val;
    notifyListeners();
  }

  void setPrice(double val) {
    _alert.price = val;
    notifyListeners();
  }

  get getNotificationMethod => _alert.notificationMethod;
  get getCurrency => _alert.currency;
  get getIsAboveNotBelow => _alert.isAboveNotBelow;
  get getPrice => _alert.price;
}
