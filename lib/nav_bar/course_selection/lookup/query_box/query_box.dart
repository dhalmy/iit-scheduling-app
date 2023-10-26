import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/query_grid.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../query_logic/course.dart';
import '../query_logic/query_logic.dart';
import '../query_logic/user_search_input.dart';
import '../year_semester_drop_down/year_semester.dart';
import '../year_semester_drop_down/year_semester_drop_down.dart';

class QueryBox extends StatefulWidget {
  const QueryBox({Key? key}) : super(key: key);

  @override
  State<QueryBox> createState() => _QueryBoxState();
}

class _QueryBoxState extends State<QueryBox> {
  late TextEditingController _searchController;
  List<Course> courses = [];
  late QueryLogic queryLogic;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    queryLogic = QueryLogic(UserSearchInput(''), YearSemester.unknown);
    _loadCourses(queryLogic); // Initial load
  }

  Future<void> _loadCourses(QueryLogic queryLogic) async {
    final newCourses = await queryLogic.parsedUserInput();
    setState(() {
      courses = newCourses;
    });
  }

  int _getColumnCourseListLength(int columnPosition) {
    if (courses.length % 3 != columnPosition) {
      print('ceil');
      return (courses.length / 3).ceil();
    } else {
      print('else');
      // print(courses);
      // print(courses.length); // 200
      // print(courses.length % 3); // 2
      print((courses.length / 3).floor());
      return (courses.length / 3).floor();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.05,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                border: Border.all(color: Colors.grey, width: 1.0),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 12),
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () async {
                      final query = _searchController.text;
                      final userInput = UserSearchInput(query);
                      await _loadCourses(QueryLogic(
                          userInput,
                          YearSemester
                              .fall2023)); // Load courses when searching
                    },
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox(child: YearSemesterDropDown())),
          ],
        ),
        const SizedBox(height: 29),
        FutureBuilder<List<Course>>(
          future: Future.value(courses), // Wrap the list in a Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final courses = snapshot.data ?? [];
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.699,
                child: QueryGrid(
                  courses: courses,
                  firstColumnCourseListLength: _getColumnCourseListLength(0),
                  secondColumnCourseListLength: _getColumnCourseListLength(1),
                  thirdColumnCourseListLength: _getColumnCourseListLength(2),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
