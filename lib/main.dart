import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const DartIsolateApp());

class DartIsolateApp extends StatelessWidget {
  const DartIsolateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Isolates em Dart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyanAccent),
      ),
      home: const HomeScreen(),
    );
  }
}
