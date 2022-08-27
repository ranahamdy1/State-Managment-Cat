import 'package:cat_state2/constants/global_methods.dart';
import 'package:cat_state2/screens/people/screens/single_people_screen.dart';
import 'package:cat_state2/screens/people/view_model/all_view_model.dart';
import 'package:cat_state2/screens/people/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class People extends StatelessWidget {
  const People({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<PeopleViewModel>();
    final people = viewModel.people;
    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
      ),
      body: ListView(
        children: [
          for (final person in people)
            InkWell(
              onTap: () {
                NavigateTo(
                    context,
                    Provider(
                        create: (_) => SingleViewModel(person),
                        child: const SinglePeopleScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(person.name),
              ),
            )
        ],
      ),
    );
  }
}
