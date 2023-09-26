import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/preview.dart';

import 'lookup/lookup.dart';

class CourseSelection extends StatelessWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Set a gray background with some transparency
        borderRadius: BorderRadius.circular(20.0), // Adjust the border radius as needed
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lookup(), // Include the Lookup widget
          SizedBox(width: 10.0), // Add some spacing between widgets
          Preview(), // Include the Preview widget
        ],
      ),
    );
  }
}