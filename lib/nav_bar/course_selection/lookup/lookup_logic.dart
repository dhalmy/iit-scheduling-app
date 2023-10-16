// Sort the list of course subjects alphabetically.
void sortCourseSubjectsAlphabetically(List<Map<String, String>> courseSubjects) {
  courseSubjects.sort((a, b) => a['courseSubject']!.compareTo(b['courseSubject']!));
}

// Group the list of course subjects by subject area.
Map<String, List<Map<String, String>>> groupCourseSubjectsByArea(
    List<Map<String, String>> courseSubjects) {
  final Map<String, List<Map<String, String>>> courseSubjectsByArea = {};
  for (final courseSubject in courseSubjects) {
    final subjectArea = courseSubject['courseSubject']![0];
    if (!courseSubjectsByArea.containsKey(subjectArea)) {
      courseSubjectsByArea[subjectArea] = [];
    }
    courseSubjectsByArea[subjectArea]!.add(courseSubject);
  }
  return courseSubjectsByArea;
}

// Display the list of course subjects in a more readable format.
void displayCourseSubjects(Map<String, List<Map<String, String>>> courseSubjectsByArea) {
  print('Course Subjects by Area:');
  for (final subjectArea in courseSubjectsByArea.keys) {
    print('  - $subjectArea:');
    for (final courseSubject in courseSubjectsByArea[subjectArea]!) {
      print('    - ${courseSubject['courseSubject']}');
    }
  }
}

// Example usage:

final courseSubjects = [
  {'courseSubject': 'AAH'},
  {'courseSubject': 'ARCH'},
  {'courseSubject': 'AS'},
  {'courseSubject': 'BIOL'},
  {'courseSubject': 'BME'},
  {'courseSubject': 'BUS'},
  {'courseSubject': 'CAE'},
  {'courseSubject': 'CHE'},
  {'courseSubject': 'CIV'},
];