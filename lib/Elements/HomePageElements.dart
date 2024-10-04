import 'package:clander/Elements/reusable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

SizedBox TopBar() {
  return SizedBox(
    child: Stack(children: [
      Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 70, 0, 0),
          child: Text(
            "CLANDER",
            textAlign: TextAlign.right,
            style: GoogleFonts.instrumentSerif(
                fontSize: 50,
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      Align(
          alignment: Alignment.topRight,
          child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 70, 30, 0),
              child: InkWell(
                onTap: () {},
                child: Text(
                  "...",
                  textAlign: TextAlign.right,
                  style: GoogleFonts.instrumentSerif(
                      fontSize: 50,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w500),
                ),
              ))),
    ]),
  );
}

Widget Calender(double sWidth, int startDay, int noDays, int lastMonthDays,
    DateTime today) {
  List dList = makeDateTable(startDay, noDays, lastMonthDays);
  for (int i = 0; i < 6; i++) {
    debugPrint(
        "\t${dList[i][0]}\t${dList[i][1]}\t${dList[i][2]}\t${dList[i][3]}\t${dList[i][4]}\t${dList[i][5]}\t${dList[i][6]}");
  }
  return Padding(
    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
    child: Container(
      width: sWidth - 50,
      height: (sWidth - 50) * 6 / 7,
      decoration: BoxDecoration(color: Colors.transparent),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        crossAxisCount: 7,
        children: List.generate(42, (index) {
          int i = (index / 7).floor();
          int j = index % 7;

          return Container(
            decoration: BoxDecoration(
                color: Colors.transparent, border: dateBorder(i, j)),
            child: dateObject(dList, i, j, today),
          );
        }),
      ),
    ),
  );
}

Border dateBorder(int i, int j) {
  double t = 1, b = 1, l = 1, r = 1;

  if (i == 0) {
    t = 0;
  } else if (i == 5) {
    b = 0;
  }

  if (j == 0) {
    l = 0;
  } else if (j == 6) {
    r = 0;
  }

  if (i == 6) {
    t = 0;
    b = 0;
    l = 0;
    r = 0;
  }

  return Border(
    top: BorderSide(color: toColor("e6e6e6", opacity: t), width: 1),
    bottom: BorderSide(color: toColor("e6e6e6", opacity: b), width: 1),
    left: BorderSide(color: toColor("e6e6e6", opacity: l), width: 1),
    right: BorderSide(color: toColor("e6e6e6", opacity: r), width: 1),
  );
}

Widget dateObject(List dList, int i, int j, DateTime today) {
  int date = dList[i][j];
  String dateStr = "${date.abs()}";
  String dateClr = "e6e6e6";
  Widget Dot = Container();

  if (date < 0) {
    dateClr = "7f7f7f";
  }

  if ((j == 0) && (date > 0)) {
    dateClr = "ff6969";
  }

  if ((date == today.day) &&
      (today.month == DateTime.now().month) &&
      (today.year == DateTime.now().year)) {
    Dot = createDot();
  }

  return Stack(children: [
    Center(
      child: Text(
        dateStr,
        style: GoogleFonts.instrumentSerif(
            fontSize: 20, color: toColor(dateClr), fontWeight: FontWeight.w500),
      ),
    ),
    Dot,
  ]);
}

Widget monthChoose(double sWidth, DateTime today, Function update) {
  return Padding(
      padding: EdgeInsets.fromLTRB(
          25 + sWidth / 16 - 2, 30, 25 + sWidth / 16 - 2, 0),
      child: Container(
          width: (sWidth - 50 - sWidth / 8) + 4,
          height: ((sWidth - 50 - sWidth / 8) * 2 / 6) + 4,
          decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border(
                top: BorderSide(color: toColor("e6e6e6"), width: 2),
                bottom: BorderSide(color: toColor("e6e6e6"), width: 2),
                left: BorderSide(color: toColor("e6e6e6"), width: 2),
                right: BorderSide(color: toColor("e6e6e6"), width: 2),
              )),
          child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 6,
              children: List.generate(12, (index) {
                Widget Dot = Container();
                Color textColor = toColor("e6e6e6");
                if ((index == DateTime.now().month - 1) &&
                    (today.year == DateTime.now().year)) {
                  Dot = createDot();
                }
                if ((index == today.month - 1)) {
                  textColor = toColor("ff6969");
                }

                return Stack(children: [
                  InkWell(
                    onTap: () {
                      update(index);
                    },
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: GoogleFonts.instrumentSerif(
                            fontSize: 20,
                            color: textColor,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Dot
                ]);
              }))));
}

Widget dayRow(double sWidth) {
  List days = ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
  List dateClr = [
    "ff6969",
    "e6e6e6",
    "e6e6e6",
    "e6e6e6",
    "e6e6e6",
    "e6e6e6",
    "e6e6e6"
  ];
  return Padding(
      padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
      child: Container(
          width: sWidth - 50,
          height: (sWidth - 50) / 7,
          decoration: BoxDecoration(color: Colors.transparent),
          child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              crossAxisCount: 7,
              children: List.generate(7, (index) {
                return Center(
                  child: Text(
                    days[index],
                    style: GoogleFonts.instrumentSerif(
                        fontSize: 20,
                        color: toColor(dateClr[index]),
                        fontWeight: FontWeight.w500),
                  ),
                );
              }))));
}

Widget createDot() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 9, 9, 0),
    child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
              gradient: RadialGradient(colors: [
            toColor("dd5050"),
            Colors.transparent
          ], stops: const [
            1,
            1,
          ])),
        )),
  );
}
