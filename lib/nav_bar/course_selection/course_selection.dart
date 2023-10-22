import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/preview/preview.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'lookup/lookup.dart';
import 'dart:collection';


class CourseSelection extends StatefulWidget {
  const CourseSelection({Key? key}) : super(key: key);

  @override
  State<CourseSelection> createState() => _CourseSelectionState();
}

class _CourseSelectionState extends State<CourseSelection> {
  List<String> _courseSubjects = [];

  @override
  void initState() {
    super.initState();

    // _fetchData();
    // sortCourseSubjectsAlphabetically(courseSubjects);
    // final courseSubjectsByArea = groupCourseSubjectsByArea(courseSubjects);
    // displayCourseSubjects(courseSubjectsByArea);
  }

  // Future<void> _fetchData() async {
  //   try {
  //     final data = await Supabase.instance.client.from('fall2023').select('courseSubject');
  //     print(data);
  //   } catch (error) {
  //     // Handle error
  //   }
  // }

  // Future<void> _fetchData() async {
  //   try {
  //     final data = await Supabase.instance.client.from('fall2023').select('courseSubject');
  //
  //     // Sort the course subjects alphabetically.
  //     _courseSubjects = data.data.map((e) => e['courseSubject']).toList();
  //     _courseSubjects.sort((a, b) => a.compareTo(b));
  //
  //     // Display the course subjects.
  //     setState(() {});
  //   } catch (error) {
  //     // Handle error
  //   }
  // }

  // Future<void> _fetchData() async {
  //   try {
  //     final data = await Supabase.instance.client.from('fall2023').select('courseSubject');
  //
  //     // Sort the course subjects alphabetically.
  //     _courseSubjects = data.data.map((e) => e['courseSubject']).toList();
  //     _courseSubjects.sort((a, b) => a.compareTo(b));
  //
  //     // Display the sorted course subjects.
  //     print('Course subjects (sorted alphabetically):');
  //     for (final courseSubject in _courseSubjects) {
  //       print("Printed!");
  //       print(courseSubject);
  //     }
  //   } catch (error) {
  //     // Handle error
  //     print("Failed");
  //   }
  // }

// // Sort the list of course subjects alphabetically.
//   void sortCourseSubjectsAlphabetically(List<Map<String, String>> courseSubjects) {
//     courseSubjects.sort((a, b) => a['courseSubject']!.compareTo(b['courseSubject']!));
//   }
//
// // Group the list of course subjects by subject area.
//   Map<String, List<Map<String, String>>> groupCourseSubjectsByArea(
//       List<Map<String, String>> courseSubjects) {
//     final Map<String, List<Map<String, String>>> courseSubjectsByArea = {};
//     for (final courseSubject in courseSubjects) {
//       final subjectArea = courseSubject['courseSubject']![0];
//       if (!courseSubjectsByArea.containsKey(subjectArea)) {
//         courseSubjectsByArea[subjectArea] = [];
//       }
//       courseSubjectsByArea[subjectArea]!.add(courseSubject);
//     }
//     return courseSubjectsByArea;
//   }
//
// // Display the list of course subjects in a more readable format.
//   void displayCourseSubjects(Map<String, List<Map<String, String>>> courseSubjectsByArea) {
//     print('Course Subjects by Area:');
//     for (final subjectArea in courseSubjectsByArea.keys) {
//       print('  - $subjectArea:');
//       for (final courseSubject in courseSubjectsByArea[subjectArea]!) {
//         print('    - ${courseSubject['courseSubject']}');
//       }
//     }
//   }
//
// // Example usage:
//
//   final courseSubjects = [
//     {'courseSubject': 'AAH'},
//     {'courseSubject': 'ARCH'},
//     {'courseSubject': 'AS'},
//     {'courseSubject': 'BIOL'},
//     {'courseSubject': 'BME'},
//     {'courseSubject': 'BUS'},
//     {'courseSubject': 'CAE'},
//     {'courseSubject': 'CHE'},
//     {'courseSubject': 'CIV'},
//   ];


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