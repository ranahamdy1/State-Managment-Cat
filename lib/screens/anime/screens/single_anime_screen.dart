import 'package:cat_state2/constants/widgets.dart';
import 'package:cat_state2/screens/anime/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SingleAnimeScreen extends StatelessWidget {
  const SingleAnimeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<SingleAnimeViewModel>();
    final anime = viewmodel.anime;
    return Scaffold(
      appBar: AppBar(
        title: Text(anime.title),
      ),
      body: Column(
        children: [
          myNetworkImage(url: anime.banner),
          Text(
            anime.description,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade500),
          ),
          const myDivider(),
          peopleWidget(),
          const myDivider(),
          locationWidget(),
          const Divider(),
          speciesWidget(),
          const Divider(),
          vehicalWidget(),
          const Divider(),
        ],
      ),
    );
  }
}
