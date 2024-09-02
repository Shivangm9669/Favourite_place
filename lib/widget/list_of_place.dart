import 'package:favourite_place/model/place.dart';
import 'package:favourite_place/screens/place_details.dart';
import 'package:flutter/material.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({super.key, required this.places});

  final List<Places> places;

  @override
  Widget build(BuildContext context) {
    Widget detailofScreen = const Center(
      child: Text(
        "OOPs sorry no favourite place to show",
        style: TextStyle(color: Colors.black),
      ),
    );
    if (places.isNotEmpty) {
      detailofScreen = ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(
            places[index].title,
            style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (contex) => PlaceDetails(place: places[index])));
          },
          tileColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.white)),
        ),
      );
    }
    return detailofScreen;
  }
}
