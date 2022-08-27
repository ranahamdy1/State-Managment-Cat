import 'package:cat_state2/response_model.dart';
import 'package:cat_state2/screens/anime/widget/all_anime_respotory.dart';
import 'package:flutter/material.dart';
import '../../../models/anime_model.dart';

class AllAnimViewModel with ChangeNotifier {
  var allAnime = <AnimeModel>[];

  Future<ResponseModel<List<AnimeModel>>> getAllAnime() async {
    final result = await AllAnimeRepository.parseAllAnime();

    if (result.statusCode == 200) {
      allAnime = result.data ?? [];
      notifyListeners();
    }
    return result;
  }
}
