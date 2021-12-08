import 'package:flutter/foundation.dart';
// import 'package:provider/provider.dart';
import 'user.dart';

class UserProvider with ChangeNotifier {
  User _user = User();

  User get getUser {
    return _user;
  }

  void nextLevel() {
    _user.currentLevel += 1;
    notifyListeners();
  }
}
