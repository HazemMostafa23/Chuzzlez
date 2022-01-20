import 'package:chuzzlez/models/leaderboard.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:flutter/cupertino.dart';

class LeaderboardProvider with ChangeNotifier {
  late FireStoreServices instance = FireStoreServices();

  Leaderboard leadInstance = Leaderboard();

  readScoreBoard() async {
    var ScoreMaps = await instance.getScores();
    leadInstance.length = ScoreMaps.length;

    for (var i = 0; i < leadInstance.length; i++) {
      if (leadInstance.scoreboard.length < leadInstance.length) {
        var ScoreMap = ScoreMaps[i];

        leadInstance.scoreboard.add(
            {'Name': ScoreMap['firstname'], 'Score': ScoreMap['total_score']});
      }
    }
    print(leadInstance.scoreboard);
  }
}
