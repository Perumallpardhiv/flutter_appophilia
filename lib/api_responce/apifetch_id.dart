import 'package:appophilia/models/game_model_id.dart';
import 'package:http/http.dart' as http;

getGameId(int id) async {
  var uri = Uri.parse("https://www.freetogame.com/api/game?id=${id}");

  // var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});
  final response = await http.get(uri, headers: {
    "X-RapidAPI-Key": "d6c16df18bmsha63dbb82162dc4dp1bff5ejsn48f5a5a27684",
    "X-RapidAPI-Host": "free-to-play-games-database.p.rapidapi.com",
  });

  try {
    if (response.statusCode == 200) {
      var data = gameModelIdFromJson(response.body);
      return data;
    }
  } catch (e) {
    print(e.toString());
  }
}
