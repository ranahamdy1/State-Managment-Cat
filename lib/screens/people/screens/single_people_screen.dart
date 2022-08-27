import 'package:cat_state2/screens/people/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SinglePeopleScreen extends StatelessWidget {
  const SinglePeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleViewModel>();
    final person = viewModel.person;
    return Scaffold(
      appBar: AppBar(
        title: Text(person.name),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ID ${person.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Gender ${person.gender}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Age ${person.age}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("HairColor ${person.hairColor}"),
            ),
          ],
        ),
      ),
    );
  }
}
