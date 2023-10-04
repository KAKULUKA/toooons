import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toooons/models/webtoon_detail_model.dart';
import 'package:toooons/models/webtoon_episode_model.dart';
import 'package:toooons/models/webtoon_models.dart';

class ApiService {
  static const String baseUrl =
      "http://webtoon-crawler.nomadcoders.workers.dev";

  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstance = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url); //data가 올떄까지 기다린다.
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstance.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstance;
    }
    throw Error();
  }

  static Future<WebToonDetailModel> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebToonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebToonEpisodeModel>> getLatestEpisodeById(
      String id) async {
    List<WebToonEpisodeModel> episodesInstaces = [];

    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstaces.add(WebToonEpisodeModel.fromJson(episode));
      }
      return episodesInstaces;
    }
    throw Error();
  }
}
