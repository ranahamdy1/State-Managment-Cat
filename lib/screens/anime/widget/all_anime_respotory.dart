import 'dart:convert';
import 'dart:io';

import 'package:cat_state2/screens/anime/widget/all_anime_service.dart';

import '../../../models/anime_model.dart';
import '../../../response_model.dart';

class AllAnimeRepository {
  //AllAnimeRepository._();

  static Future<ResponseModel<List<AnimeModel>>> parseAllAnime() async {
    try {
      final response = await AllAnimeService.fetchAllAnime();
      if (response.statusCode == 200) {
        final result = json.decode(response.body);
        final animeModels = AnimeModel.parseList(
          result.cast<Map<String, dynamic>>(),
        );

        return ResponseModel(
          statusCode: response.statusCode,
          data: animeModels,
        );
      } else {
        return ResponseModel.error();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.networkError();
      }

      return ResponseModel.error();
    }
  }
}
