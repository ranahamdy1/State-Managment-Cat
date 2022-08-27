import 'package:cat_state2/constants/global_methods.dart';
import 'package:cat_state2/screens/location/screens/single_location_screen.dart';
import 'package:cat_state2/screens/location/view_model/all_view_model.dart';
import 'package:cat_state2/screens/location/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AllLocationViewModel>();
    final location = viewModel.location;
    return Scaffold(
      appBar: AppBar(
        title: Text("location"),
      ),
      body: ListView(
        children: [
          for (final location in location)
            InkWell(
              onTap: () {
                NavigateTo(
                    context,
                    Provider(
                        create: (_) => SingleLocationViewModel(location),
                        child: const SingleLocationScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(location.name),
              ),
            )
        ],
      ),
    );
  }
}
