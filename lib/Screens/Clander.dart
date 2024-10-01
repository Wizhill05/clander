import 'package:clander/Elements/HomePageElements.dart';
import 'package:clander/Elements/reusable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    double sWidth = MediaQuery.of(context).size.width;
    double sHeight = MediaQuery.of(context).size.height;
    DateTime _date = new DateTime.now();
    int lastMonth = _date.month - 1;
    return Scaffold(
      body: Container(
        width: sWidth,
        height: sHeight,
        decoration: BoxDecoration(color: Colors.black.withAlpha(250)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Calender(
                  sWidth,
                  ((_date.weekday % 7) - (_date.day % 7) + 1) % 7,
                  getDaysInMonth(_date.year, _date.month),
                  getDaysInMonth(_date.year, _date.month - 1),
                  _date.day),
            ],
          ),
        ),
      ),
    );
  }
}
