import 'package:clander/Elements/monoElements.dart';
import 'package:clander/Elements/reusable.dart';
import 'package:flutter/material.dart';
import 'package:clander/main.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime _setDate;

  @override
  void initState() {
    super.initState();
    _setDate = DateTime.now();
  }

  void _setMonthMethod(int month) {
    setState(() {
      if ((month >= 0) && (month < 12))
        (_setDate = DateTime(_setDate.year, month + 1, _setDate.day));
    });
  }

  void _setYearMethod(int index) {
    setState(() {
      if (index == 0) {
        (_setDate =
            DateTime(_setDate.year.abs(), _setDate.month, _setDate.day));
      } else if (index == 5) {
        (_setDate =
            DateTime(0 - _setDate.year.abs(), _setDate.month, _setDate.day));
      } else if ((index == 1) && (_setDate.year.abs() > 1000)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() - 1000) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 6) &&
          (_setDate.year.abs() < 9000) &&
          (_setDate.year.abs() != 0)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() + 1000) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 2) && (_setDate.year.abs() > 100)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() - 100) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 7) &&
          (_setDate.year.abs() < 9900) &&
          (_setDate.year.abs() != 0)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() + 100) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 3) && (_setDate.year.abs() > 10)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() - 10) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 8) &&
          (_setDate.year.abs() < 9990) &&
          (_setDate.year.abs() != 0)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() + 10) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 4) && (_setDate.year.abs() > 1)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() - 1) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      } else if ((index == 4) && (_setDate.year.abs() == 1)) {
        (_setDate = DateTime(0, _setDate.month, _setDate.day));
      } else if ((index == 9) &&
          (_setDate.year.abs() < 9999) &&
          (_setDate.year.abs() != 0)) {
        (_setDate = DateTime(
            ((_setDate.year) *
                    (_setDate.year.abs() + 1) /
                    (_setDate.year.abs()))
                .floor(),
            _setDate.month,
            _setDate.day));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.black.withAlpha(250)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(),
              Padding(
                padding: EdgeInsets.fromLTRB(35, 0, 30, 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: RichText(
                    text: TextSpan(
                        text: "${_setDate.month}",
                        style: GoogleFonts.instrumentSerif(
                            fontSize: 24,
                            color: toColor("e6e6e6"),
                            fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                            text: " / ",
                            style: GoogleFonts.instrumentSerif(
                                fontSize: 24,
                                color: toColor("e6e6e6"),
                                fontWeight: FontWeight.w500),
                          ),
                          TextSpan(
                            text: "${_setDate.year}",
                            style: GoogleFonts.instrumentSerif(
                                fontSize: 24,
                                color: toColor("e6e6e6"),
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ),
              ),
              dayRow(MediaQuery.of(context).size.width),
              Calender(
                  MediaQuery.of(context).size.width,
                  ((_setDate.weekday % 7) - (_setDate.day % 7) + 1) % 7,
                  getDaysInMonth(_setDate.day, _setDate.month),
                  getDaysInMonth(_setDate.day, _setDate.month - 1),
                  _setDate),
              monthChoose(
                  MediaQuery.of(context).size.width, _setDate, _setMonthMethod),
              yearChoose(
                  MediaQuery.of(context).size.width, _setDate, _setYearMethod)
            ],
          ),
        ),
      ),
    );
  }
}
