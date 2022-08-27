import 'dart:convert';
import 'dart:io';
import 'package:cat_state2/constants/global_service.dart';
import 'package:cat_state2/models/location_model.dart';
import 'package:cat_state2/response_model.dart';

class LocationRepostory {
  static Future<ResponseModel<List<LocationModel>>> newLocation(
      String url) async {
    try {
      final response = await GlobalService.fetchDate(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data is Map<String, dynamic>) {
          final location = LocationModel.fromMap(data);

          return ResponseModel(
            statusCode: response.statusCode,
            data: [location],
          );
        } else {
          final location =
              LocationModel.parseList(data.cast<Map<String, dynamic>>());
          return ResponseModel(
            statusCode: response.statusCode,
            data: location,
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
