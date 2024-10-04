import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Screens/Clander_mono.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clander',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        fontFamily: GoogleFonts.geo().fontFamily,
      ),
      home: const Home(),
    );
  }
}
