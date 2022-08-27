import 'dart:convert';
import 'dart:io';
import 'package:cat_state2/constants/global_service.dart';
import 'package:cat_state2/models/people_model.dart';
import 'package:cat_state2/response_model.dart';

class PeopleRepostory {
  static Future<ResponseModel<List<PersonModel>>> newPeople(String url) async {
    try {
      final response = await GlobalService.fetchDate(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is Map<String, dynamic>) {
          final person = PersonModel.fromMap(data);

          return ResponseModel(
            statusCode: response.statusCode,
            data: [person],
          );
        } else {
          final people =
              PersonModel.parseList(data.cast<Map<String, dynamic>>());
          return ResponseModel(
            statusCode: response.statusCode,
            data: people,
          );
        }
      } else {
        return ResponseModel.error();
      }
    } catch (e) {
      if (e is SocketException) {
        return ResponseModel.networkError();
      }
    }
    return ResponseModel.error();
  }
}
