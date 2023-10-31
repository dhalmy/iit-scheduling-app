import 'package:flutter/material.dart';

import '../query_logic/course.dart';

class CourseItemWidget extends StatelessWidget {
  final Course course;
  final double height;
  final double width;
  final double fontSize;

  const CourseItemWidget({super.key, required this.course, required this.height, required this.width, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance of the course details here
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: SizedBox(
                      child: Text(course.courseCode,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: fontSize)))),
              Column(
                children: [
                  Text('Catalog >'),
                  Text('Evaluations >'),
                ],
              )
            ],
          ),
          Text(''),
          Text('Course Title: ${course.courseTitle}'),
          Text('Instructor: ${course.instructor}'),
          Text('Enrolled: ${course.enrolled}/${course.max}'),
          Text('Available: ${course.available}'),
          Row(
            children: [
              Expanded(child: SizedBox(child: Text('Sections'))),
              Text('Course Prerequisites'),
            ],
          ),
          // Add more Text widgets for other course details as needed
        ],
      ),
    );
  }
}