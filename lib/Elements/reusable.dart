import 'dart:ui';

toColor(String hexColor, {double opacity = 1}) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF$hexColor";
  }
  return Color(int.parse(hexColor, radix: 16)).withOpacity(opacity);
}

List makeDateTable(int startDay, int noDays, int lastMonthDays) {
  List dList = [
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0],
  ];

  int count = 1;
  for (int i = startDay; i < 7; i++) {
    dList[0][i] = count++;
  }

  for (int i = 1; i < 4; i++) {
    for (int j = 0; j < 7; j++) {
      dList[i][j] = count++;
    }
  }

  for (int i = 0; count <= noDays; i++) {
    if (i > 6) {
      dList[5][i - 7] = count++;
    } else {
      dList[4][i] = count++;
    }
  }

  if (startDay == 0) {
    List a = [
      [
        -lastMonthDays + 6,
        -lastMonthDays + 5,
        -lastMonthDays + 4,
        -lastMonthDays + 3,
        -lastMonthDays + 2,
        -lastMonthDays + 1,
        -lastMonthDays,
      ]
    ];
    a.addAll(dList);
    dList = a;
  }

  for (int i = 0; i < startDay; i++) {
    dList[0][i] = -(lastMonthDays - startDay + i + 1);
  }

  count = -1;

  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 7; j++) {
      if (dList[i][j] == 0) {
        dList[i][j] = count--;
      }
    }
  }
  return dList;
}

int getDaysInMonth(int year, int month) {
  if ([0, 1, 3, 5, 7, 8, 10, 12].contains(month)) {
    return 31;
  } else if (month == 2) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      return 29;
    } else {
      return 28;
    }
  } else {
    return 30;
  }
}
