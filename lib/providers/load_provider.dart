import 'package:flutter/material.dart';

class LoadProvider extends ChangeNotifier {
  bool _isLoading = false;

  void setIsLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  get getIsLoading => _isLoading;
}
