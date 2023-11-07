import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../selected_courses.dart';

Future<void> postSchedule() async {
  print("clicked!");
  var url = Uri.parse('http://localhost:5000/generate_schedule'); // Replace with your server URL
  SelectedCourses selectedCourses = SelectedCourses();
  var response = await http.post(
    url,
    headers: {"Content-Type": "application/json"},
    body: json.encode({'listData': selectedCourses}), // Sending selected courses to python server
  );

  if (response.statusCode == 200) {

    var responseData = json.decode(response.body);
    print('Response data: $responseData');

  } else {

    throw Exception('Failed to load data');
  }
}