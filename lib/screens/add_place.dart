import 'dart:io';

import 'package:favourite_place/provider/user_places.dart';
import 'package:favourite_place/widget/location_input.dart';
import 'package:favourite_place/widget/place_photo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaces extends ConsumerStatefulWidget {
  const AddPlaces({super.key});

  @override
  ConsumerState<AddPlaces> createState() => _AddPlacesState();
}

class _AddPlacesState extends ConsumerState<AddPlaces> {
  final TextEditingController _place = TextEditingController();

  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    _place.text = "";
  }

  @override
  void dispose() {
    _place.dispose();
    super.dispose();
  }

  void savePlace() {
    final enteredTitle = _place.text;
    if (enteredTitle.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(userPlaceProvider.notifier)
        .addPlace(enteredTitle, _selectedImage!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Place",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Form(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                label: const Text("Enter Place"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              maxLength: 80,
              controller: _place,
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          const SizedBox(height: 6),
          CaptureImage(
            onPickImage: (image) {
              _selectedImage = image;
            },
          ),
          const SizedBox(height: 10),
          LocationInput(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: savePlace,
                  child: Text("Add",
                      style: Theme.of(context).textTheme.titleLarge))
            ],
          )
        ],
      )),
    );
  }
}
