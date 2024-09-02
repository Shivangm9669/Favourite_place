import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favourite_place/screens/landing_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final ColorScheme kcolorschema = ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 109, 243, 153));
    return MaterialApp(
      theme: ThemeData(
        colorScheme: kcolorschema,
        textTheme: TextTheme(
            titleLarge: TextStyle(
                color: kcolorschema.onPrimary,
                fontWeight: FontWeight.normal,
                fontSize: 20),
            titleMedium: TextStyle(
                color: kcolorschema.onSecondary,
                fontWeight: FontWeight.normal,
                fontSize: 20)),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}
