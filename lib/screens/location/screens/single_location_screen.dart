import 'package:cat_state2/screens/location/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleLocationScreen extends StatelessWidget {
  const SingleLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SingleLocationViewModel>();
    final location = viewModel.location;
    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          /*children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("ID ${location.id}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("climate ${location.climate}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("surfaceWater ${location.surfaceWater}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("terrain ${location.terrain}"),
            ),
          ],*/
          children: [Text("hi")],
        ),
      ),
    );
  }
}
