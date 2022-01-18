import 'package:flutter/foundation.dart';
import '../models/user.dart';
import 'package:chuzzlez/services/fire_store_services.dart';

class UserProvider with ChangeNotifier {
  Users _user = Users();
  late FireStoreServices instance = FireStoreServices();
  Users get getUser {
    return _user;
  }

  void nextLevel() {
    _user.currentLevel += 1;

    notifyListeners();
  }

  void loadPuzzle(int index) {
    _user.currentLevel = index;
  }

  void setOpened() {
    _user.currentLevel = _user.currentLevel;
  }

  void logOut() {
    _user = Users();
    print(_user.firstName);
  }

  readUser() async {
    var z = await instance.readUser();
    _user.firstName = z['firstname'];
    _user.lastName = z['lastName'];
    _user.currentLevel = z['currentLevel'];
    _user.completedLevels = z['completedLevels'];

    // _user.firstName = z['firstname'];
    // _user.lastName = z['lastName'];
    // _user.completedLevels = z['completedLevels'];
    // _user.currentLevel = z['currentLevel'];
  }
}
