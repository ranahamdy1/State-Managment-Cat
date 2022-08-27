import 'package:cat_state2/models/location_model.dart';
import 'package:cat_state2/screens/location/widget/location_respostory.dart';
import 'package:flutter/material.dart';

class AllLocationViewModel with ChangeNotifier {
  final List<String> locationUrls;
  final List<LocationModel> location = [];
  AllLocationViewModel({required this.locationUrls});

  void getLocation() {
    for (final url in locationUrls) {
      LocationRepostory.newLocation(url).then((result) {
        location.addAll(result.data ?? []);
        notifyListeners();
      });
    }
  }
}
