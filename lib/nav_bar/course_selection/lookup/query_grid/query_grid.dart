import 'package:flutter/material.dart';

import '../query_logic/course.dart';
import 'course_item_widget.dart';

class QueryGrid extends StatelessWidget {
  final List<Course> courses;

  const QueryGrid({
    Key? key,
    required this.courses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gap = MediaQuery.of(context).size.width * 0.013;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: Row(
          children: [
            SizedBox(width: gap),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidget(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   width: 222,
            //   child: ListView.separated(
            //     itemBuilder: (context, index) {
            //       final course = courses[index];
            //       return CourseItemWidget(course: course);
            //     },
            //     separatorBuilder: (context, index) => SizedBox(height: gap),
            //     itemCount: courses.length,
            //   ),
            // ),
            SizedBox(width: gap),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidget(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   width: 275,
            //   child: ListView.separated(
            //     itemBuilder: (context, index) {
            //       final course = courses[index];
            //       return CourseItemWidget(course: course);
            //     },
            //     separatorBuilder: (context, index) => SizedBox(height: gap),
            //     itemCount: courses.length,
            //   ),
            // ),
            SizedBox(width: gap),
            Flexible(
              child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidget(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.width * 0.5,
            //   width: 222,
            //   child: ListView.separated(
            //     itemBuilder: (context, index) {
            //       final course = courses[index];
            //       return CourseItemWidget(course: course);
            //     },
            //     separatorBuilder: (context, index) => SizedBox(height: gap),
            //     itemCount: courses.length,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
