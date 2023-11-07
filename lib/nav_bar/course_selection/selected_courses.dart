import 'package:flutter/foundation.dart';

class SelectedCourses extends ChangeNotifier {
  final List<String> _courses = [];

  void addCourse(String course) {
    if (course.isEmpty || _courses.contains(course)) {
      return;
    }
    _courses.add(course);
    notifyListeners();
  }

  void removeCourse(String course) {
    _courses.remove(course);
    notifyListeners();
  }

  void clearCourses() {
    _courses.clear();
    notifyListeners();
  }

  List<String> get courses {
    return _courses;
  }
}