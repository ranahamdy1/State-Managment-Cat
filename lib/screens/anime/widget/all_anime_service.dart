import 'package:http/http.dart' as http;

import '../../../constants/constant.dart';

class AllAnimeService {
  AllAnimeService._();

  static Future<http.Response> fetchAllAnime() async {
    final Uri uri = Uri.parse('$API/films');
    return await http.get(uri);
  }
}
