import 'package:cat_state2/screens/anime/screens/single_anime_screen.dart';
import 'package:cat_state2/screens/anime/view_model/all_view_model.dart';
import 'package:cat_state2/screens/anime/view_model/single_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_methods.dart';
import '../../../constants/widgets.dart';

class One extends StatelessWidget {
  const One({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All anime Films"),
      ),
      body: ChangeNotifierProvider(
        create: (_) => AllAnimViewModel()
          ..getAllAnime().then((result) {
            if (result.statusCode != 200) {
              ShowSnackBar(context, result.message);
            }
          }),
        builder: (BuildContext context, _) {
          final viewModel = Provider.of<AllAnimViewModel>(context);
          final allAnime = viewModel.allAnime;
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: allAnime.length,
            itemBuilder: (BuildContext context, int index) {
              final anime = allAnime[index];
              return InkWell(
                onTap: () {
                  NavigateTo(
                      context,
                      Provider(
                        create: (_) => SingleAnimeViewModel(anime: anime),
                        child: const SingleAnimeScreen(),
                      ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      myNetworkImage(
                        url: anime.banner,
                      ),
                      Text(
                        ' ${anime.title}\n${anime.japaneseTitle}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        anime.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
