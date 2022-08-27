import 'package:flutter/material.dart';

class SingleSpeicesScreen extends StatelessWidget {
  const SingleSpeicesScreen({Key? key}) : super(key: key);

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
