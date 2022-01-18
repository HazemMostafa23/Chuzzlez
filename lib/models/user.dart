class Users {
  int currentLevel;
  List<dynamic> completedLevels;
  late int openedLevel;
  late String? email;
  late String uid;
  late String firstName;
  late String lastName;

  Users(
      {this.currentLevel = 0,
      this.completedLevels = const ["0"],
      this.firstName = "guest",
      this.lastName = "guest"});
  Map<String, dynamic> toMap(Users user) {
    var data = Map<String, dynamic>();

    data["uid"] = user.uid;
    data["firstname"] = user.firstName;
    data['lastName'] = user.lastName;
    data["email"] = user.email;
    data['currentLevel'] = 0;
    data['completedLevels'] = [];
    return data;
  }
}
