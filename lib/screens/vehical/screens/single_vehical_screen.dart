import 'package:flutter/material.dart';

class SingleVehicalScreen extends StatelessWidget {
  const SingleVehicalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Text("Species")),
      ),
      body: Column(
        children: [Text("Hi")],
      ),
    );
  }
}
