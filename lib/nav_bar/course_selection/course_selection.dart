import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/preview.dart';

import 'lookup/lookup.dart';

class CourseSelection extends StatelessWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Gray background with some transparency
        borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Lookup(), // Widget for looking up course information
          Spacer(), // Spacer to create space between widgets
          Preview(), // Widget for previewing course information
        ],
      ),
    );
  }
}