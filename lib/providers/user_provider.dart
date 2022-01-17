import 'package:flutter/foundation.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  Users _user = Users();

  Users get getUser {
    return _user;
  }

  void nextLevel() {
    _user.currentLevel += 1;
    notifyListeners();
  }

  void loadPuzzle(int index) {
    _user.openedLevel = index;
  }

  void setOpened() {
    _user.openedLevel = _user.currentLevel;
  }
}
