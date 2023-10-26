import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/course_item_widget_big.dart';

import '../query_logic/course.dart';
import 'course_item_widget_small.dart';

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
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 205,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidgetSmall(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
            SizedBox(width: gap),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 258,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidgetBig(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
            SizedBox(width: gap),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.5,
              width: 205,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return CourseItemWidgetSmall(course: course);
                },
                separatorBuilder: (context, index) => SizedBox(height: gap),
                itemCount: courses.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_layout_grid/flutter_layout_grid.dart';
// import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/course_item_widget_big.dart';
//
// import '../query_logic/course.dart';
// import 'course_item_widget_small.dart';
//
// class QueryGrid extends StatelessWidget {
//   final List<Course> courses;
//   final gap = 9.671999999999999; //MediaQuery.of(context).size.width * 0.0065;
//
//   const QueryGrid({
//     Key? key,
//     required this.courses,
//   }) : super(key: key);
//
//   Widget getCourseWidget(int index, Course course) {
//     if (index % 3 == 1) {
//       return CourseItemWidgetBig(course: course);
//     } else {
//       return CourseItemWidgetSmall(course: course);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return LayoutGrid(
//       columnSizes: List.generate(3, (index) => (index % 3 == 1) ? 1.fr : 0.8.fr)
//           .toList(growable: false),
//       rowSizes: (courses.isEmpty)
//           ? List.generate(3, (index) => (index % 3 == 1) ? 1.fr : 0.8.fr)
//               .toList(growable: false)
//           : List.generate((courses.length / 3).ceil(), (index) => auto),
//       // rowSizes: (courses.isEmpty)
//       //     ? List.generate(3, (index) => (index % 3 == 1) ? 1.fr : 0.8.fr)
//       //         .toList(growable: false)
//       //     : List.generate((courses.length / 3).ceil(),
//       //             (index) => (index % 3 == 1) ? 1.fr : 0.8.fr)
//       //         .toList(growable: false),
//       children: [
//         for (var i = 0; i < courses.length; i++) getCourseWidget(i, courses[i]),
//         // LayoutId(
//         //   id: i,
//         //   child: getCourseWidget(i, courses[i]),
//         // ),
//       ],
//     );
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   final gap = MediaQuery.of(context).size.width * 0.0065;
//   //   final gapSmall = MediaQuery.of(context).size.width * 0.002;
//   //
//   //   // Set the main axis extent based on the desired card height
//   //   const cardHeight = 155.0; // Adjust this value as needed
//   //
//   //   Widget getCourseWidget(int index, Course course) {
//   //     if (index % 3 == 1) {
//   //       return CourseItemWidgetBig(course: course);
//   //     } else {
//   //       return CourseItemWidgetSmall(course: course);
//   //     }
//   //   }
//   //
//   //   return ScrollConfiguration(
//   //     behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
//   //     child: CustomScrollView(
//   //       slivers: [
//   //         SliverGrid(
//   //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//   //             crossAxisCount: 3,
//   //             crossAxisSpacing: gap,
//   //             mainAxisSpacing: gap,
//   //             mainAxisExtent: cardHeight, // Set the card height to align to the top
//   //           ),
//   //           delegate: SliverChildBuilderDelegate(
//   //                 (BuildContext context, int index) {
//   //               final course = courses[index];
//   //               return getCourseWidget(index, course);
//   //             },
//   //             childCount: courses.length,
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
