import 'package:clander/Elements/HomePageElements.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: sWidth,
        height: sHeight,
        decoration: BoxDecoration(color: Colors.black.withAlpha(250)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Calender(sWidth, 5, 31, 29, 14),
            ],
          ),
        ),
      ),
    );
  }
}
