import 'package:cached_network_image/cached_network_image.dart';
import 'package:cat_state2/constants/global_methods.dart';
import 'package:cat_state2/screens/anime/view_model/single_view_model.dart';
import 'package:cat_state2/screens/location/screens/all_location_screen.dart';
import 'package:cat_state2/screens/location/view_model/all_view_model.dart';
import 'package:cat_state2/screens/people/screens/all_people_screen.dart';
import 'package:cat_state2/screens/people/view_model/all_view_model.dart';
import 'package:cat_state2/screens/species/screens/all_species_screen.dart';
import 'package:cat_state2/screens/vehical/screens/all_vehical_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class myNetworkImage extends StatelessWidget {
  const myNetworkImage({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      errorWidget: (_, __, ___) {
        return Center(
          child: Text("An Error occurred"),
        );
      },
      placeholder: (_, __) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class myDivider extends StatelessWidget {
  const myDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey.shade500,
      thickness: 2,
    );
  }
}

class vehicalWidget extends StatelessWidget {
  const vehicalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateTo(context, AllVehical());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Vehical",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class speciesWidget extends StatelessWidget {
  const speciesWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateTo(context, AllSpecies());
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Species",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class locationWidget extends StatelessWidget {
  const locationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<SingleAnimeViewModel>();
    final anime = viewmodel.anime;
    return InkWell(
      onTap: () {
        NavigateTo(
          context,
          Provider(
            create: (_) => AllLocationViewModel(locationUrls: anime.locations)
              ..getLocation(),
            child: const Location(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Location",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class peopleWidget extends StatelessWidget {
  const peopleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<SingleAnimeViewModel>();
    final anime = viewmodel.anime;
    return InkWell(
      onTap: () {
        NavigateTo(
          context,
          ChangeNotifierProvider(
            create: (_) =>
                PeopleViewModel(peopleUrls: anime.people)..getPeople(),
            child: const People(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "People",
              style: TextStyle(fontSize: 20),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
