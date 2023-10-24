class UserSearchInput {
  final String userInput;
  final String _courseSubject = '';
  final String _courseNumber = '';
  final String _instructor = '';

  UserSearchInput(this.userInput);

  // Getter for the user input
  String get getUserInput => userInput;

  set setCourseSubject(String courseSubject) => courseSubject = courseSubject;
  String get getCourseSubject => _courseSubject;

  set setCourseNumber(String courseNumber) => courseNumber = courseNumber;
  String get getCourseNumber => _courseNumber;

  set setInstructor(String instructor) => instructor = instructor;
  String get getInstructor => _instructor;
}