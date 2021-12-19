class User {
  int currentLevel;
  List<String> completedLevels;
  late int openedLevel;

  User({this.currentLevel = 0, this.completedLevels = const ["0", "1"]});
}
