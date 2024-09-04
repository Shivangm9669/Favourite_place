import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CaptureImage extends StatefulWidget {
  const CaptureImage({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<CaptureImage> createState() => _PhotoCaptureState();
}

class _PhotoCaptureState extends State<CaptureImage> {
  File? _selectedImage;
  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);

    // ignore: unnecessary_null_comparison
    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    widget.onPickImage(_selectedImage!);
  }

  @override 
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text("Take Picture"),
      onPressed: _takePicture,
    );
    if (_selectedImage != null) {
      content = GestureDetector(
        onTap: _takePicture,
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }
    return Container(
        width: double.infinity,
        height: 250,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(width: 1),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        child: content);
  }
}
