import 'dart:convert';

import 'package:appophilia/models/game_model.dart';
import 'package:http/http.dart' as http;

// class GamesClass {
getGame() async {
  var uri = Uri.parse("https://www.freetogame.com/api/games");

  // var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});
  final response = await http.get(uri, headers: {
    "X-RapidAPI-Key": "d6c16df18bmsha63dbb82162dc4dp1bff5ejsn48f5a5a27684",
    "X-RapidAPI-Host": "free-to-play-games-database.p.rapidapi.com",
  });

  try {
    if (response.statusCode == 200) {
      var data = gamesFromJson(response.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
  }

  // Map data = json.decode(response.body);
  // List _temp = [];
  // for (var i in data[0]) {
  //   _temp.add(i);
  // }
  // return Games.fromJson(_temp);
}
// }
