import 'package:flutter/material.dart';

class SelectedCourses with ChangeNotifier {
  static SelectedCourses? _instance;

  SelectedCourses(); // Named constructor

  static SelectedCourses? get instance {
    _instance ??= SelectedCourses._();
    return _instance;
  }

  SelectedCourses._();

  final List<String> _courses = [];

  void addCourse(String course) {
    // Check if the course code or name is empty.
    if (course.isEmpty) {
      return;
    }

    // Check if the course code or name already exists in the list.
    if (_courses.contains(course)) {
      return;
    }

    // Add the course to the list.
    _courses.add(course);
  }

  void removeCourse(String course) {
    // Check if the course code or name is in the list.
    if (!_courses.contains(course)) {
      return;
    }

    // Remove the course from the list.
    _courses.remove(course);
  }

  void clearCourses() {
    // Clear the list of selected courses.
    _courses.clear();
  }

  List<String> get courses {
    return _courses;
  }

  // Implement the notifyListeners method to notify listeners of changes
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}