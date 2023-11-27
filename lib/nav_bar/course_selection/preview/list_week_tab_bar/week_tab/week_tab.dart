import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';

class WeekTab extends StatefulWidget {
  const WeekTab({Key? key}) : super(key: key);

  @override
  State<WeekTab> createState() => _WeekTabState();
}

class _WeekTabState extends State<WeekTab> {
  // Define constants for colors
  static const Color colorRed = Colors.red;
  static const Color colorBlue = Colors.blue;
  static const Color colorGreen = Colors.green;
  static const Color colorYellow = Colors.yellow;
  static const Color colorPurple = Colors.purple;
  static const Color colorOrange = Colors.orange;

  // Define days of the week and time slots
  List<String> daysOfWeek = ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'];
  List<String> timeSlots = ['800', '900', '1000', '1100', '1200', '1300', '1400', '1500', '1600', '1700', '1800', '1900', '2000', '2100', '2200'];

  List<NamedAreaGridPlacement> generateGridPlacements() {
    List<NamedAreaGridPlacement> gridPlacements = [];

    for (String day in daysOfWeek) {
      for (String timeSlot in timeSlots) {
        gridPlacements.add(
          NamedAreaGridPlacement(
            areaName: '$day $timeSlot',
            child: Container(color: colorOrange),
          ),
        );
      }
    }

    return gridPlacements;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: LayoutGrid(
        areas: '''
    . monday tuesday wednesday thursday friday
    800 . . . . .
    900 . . . . .
    1000 . . . . .
    1100 . . . . .
    1200 . . . . .
    1300 . . . . .
    1400 . . . . .
    1500 . . . . .
    1600 . . . . .
    1700 . . . . .
    1800 . . . . .
    1900 . . . . .
    2000 . . . . .
    2100 . . . . .
    2200 . . . . .
  ''',
        columnSizes: [
          1.fr,
          1.fr,
          1.fr,
          1.fr,
          1.fr,
          1.fr
        ],
        rowSizes: List.filled(16, 1.fr),
        children: generateGridPlacements(),
      ),
    );
  }
}