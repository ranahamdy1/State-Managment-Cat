import 'package:cat_state2/models/people_model.dart';
import 'package:cat_state2/screens/people/widget/people_repostory.dart';
import 'package:flutter/material.dart';

class PeopleViewModel with ChangeNotifier {
  final List<String> peopleUrls;
  final List<PersonModel> people = [];
  PeopleViewModel({required this.peopleUrls});

  void getPeople() {
    for (final url in peopleUrls) {
      PeopleRepostory.newPeople(url).then((result) {
        people.addAll(result.data ?? []);
        notifyListeners();
      });
    }
  }
}
