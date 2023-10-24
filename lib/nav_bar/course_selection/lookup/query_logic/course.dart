class Course {
  final String status;
  final int departmentCode;
  final String courseCode;
  final String courseSubject;
  final int courseNumber;
  final String courseTitle;
  final String crossListCode;
  final String college;
  final String department;
  final String courseType;
  final int credits;
  final String days;
  final String time;
  final String instructor;
  final int max;
  final int enrolled;
  final int available;
  final int waitCount;
  final String campus;
  final String locations;
  final int seating;
  final String dates;

  Course({
    required this.status,
    required this.departmentCode,
    required this.courseCode,
    required this.courseSubject,
    required this.courseNumber,
    required this.courseTitle,
    required this.crossListCode,
    required this.college,
    required this.department,
    required this.courseType,
    required this.credits,
    required this.days,
    required this.time,
    required this.instructor,
    required this.max,
    required this.enrolled,
    required this.available,
    required this.waitCount,
    required this.campus,
    required this.locations,
    required this.seating,
    required this.dates,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      status: json['status'] as String,
      departmentCode: json['departmentCode'] as int,
      courseCode: json['courseCode'] as String,
      courseSubject: json['courseSubject'] as String,
      courseNumber: json['courseNumber'] as int,
      courseTitle: json['courseTitle'] as String,
      crossListCode: json['crossListCode'] as String,
      college: json['college'] as String,
      department: json['department'] as String,
      courseType: json['courseType'] as String,
      credits: json['credits'] as int,
      days: json['days'] as String,
      time: json['time'] as String,
      instructor: json['instructor'] as String,
      max: int.tryParse(json['max'].toString()) ?? 0,
      enrolled: int.tryParse(json['enrolled'].toString()) ?? 0,
      available: int.tryParse(json['available'].toString()) ?? 0,
      waitCount: int.tryParse(json['waitCount'].toString()) ?? 0,
      campus: json['campus'] as String,
      locations: json['locations'] as String,
      seating: int.tryParse(json['seating'].toString()) ?? 0,
      dates: json['dates'] as String,
    );
  }
}