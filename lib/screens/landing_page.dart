import 'package:favourite_place/provider/user_places.dart';
import 'package:favourite_place/screens/add_place.dart';
import 'package:favourite_place/widget/list_of_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlaceProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => const AddPlaces())));
            },
            icon: const Icon(Icons.add),
          ),
        ],
        title: Text(
          "Demo",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlaceList(places: userPlaces),
      ),
    );
  }
}
