import 'package:flutter/material.dart';

import '../query_logic/course.dart';

class CourseItemWidget extends StatelessWidget {
  final Course course;

  CourseItemWidget({required this.course});

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance of the course details here
    return Container(
      height: 125,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Course Code: ${course.courseCode}'),
          Text('Course Title: ${course.courseTitle}'),
          Text('Instructor: ${course.instructor}'),
          Text('Enrolled: ${course.enrolled}/${course.max}'),
          Text('Available: ${course.available}'),
          // Add more Text widgets for other course details as needed
        ],
      ),
    );
  }
}