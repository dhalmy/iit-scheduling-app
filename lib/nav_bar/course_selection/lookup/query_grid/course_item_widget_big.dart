import 'package:flutter/material.dart';

import '../query_logic/course.dart';

class CourseItemWidgetBig extends StatelessWidget {
  final Course course;

  CourseItemWidgetBig({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    // You can customize the appearance of the course details here
    return Container(
      height: 155,
      width: 258,
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
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 32)))),
              Column(
                children: [
                  Text('Catalog >'),
                  Text('Evaluations >'),
                ],
              )
            ],
          ),
          Text(''),
          Row(),
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
