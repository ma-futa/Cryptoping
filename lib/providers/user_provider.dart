import 'package:flutter/cupertino.dart';

import '../models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(email: '', name: '', number: '');

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  get getUser => _user;
  get getName => _user.name;
  get getEmail => _user.email;
  get getNumber => _user.number;
}
