import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_box/query_box.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/query_grid.dart';

import 'year_semester_drop_down/year_semester_drop_down.dart';

class Lookup extends StatelessWidget {
  const Lookup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a SizedBox with a width of 47.5% of the screen width
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.525,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              QueryBox(),
              Spacer(),
              YearSemesterDropDown(),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
              child: const QueryGrid()),
        ],
      ),
    );
  }
}