import 'package:flutter/cupertino.dart';

class AlertProvider extends ChangeNotifier {
  int _notificationMethod = 0;
  int _currency = 0;
  int _isAbove = 0;
  double _price = 0.0;
  int _cryptoPlatform = 0;

  void setNotificationMethod(int val) {
    _notificationMethod = val;
    notifyListeners();
  }

  void setCurrency(int val) {
    _currency = val;
    notifyListeners();
  }

  void setIsAbove(int val) {
    _isAbove = val;
    notifyListeners();
  }

  void setPrice(double val) {
    _price = val;
    notifyListeners();
  }

  void setCrptoPlatform(int val) {
    _cryptoPlatform = val;
    notifyListeners();
  }

  get getNotificationMethod => _notificationMethod;
  get getCurrency => _currency;
  get getIsAbove => _isAbove;
  get getPrice => _price;
  get getCryptoPlatform => _cryptoPlatform;
}
