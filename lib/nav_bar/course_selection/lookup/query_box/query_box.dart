import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/query_grid.dart';

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
  bool isMouseEnter = false;

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

  void _onExitMouse(PointerEvent details) {
    setState(() {
      isMouseEnter = false;
    });
  }

  void _onEnterMouse(PointerEvent details) {
    setState(() {
      isMouseEnter = true;
    });
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
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      // width: 446.4,
                      // height: 35.36,
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
                                contentPadding: EdgeInsets.only(bottom: 0.5),
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
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: MouseRegion(
                        onEnter: _onEnterMouse,
                        onExit: _onExitMouse,
                        child: AnimatedContainer(
                          padding: EdgeInsets.zero,
                          width: 28,
                          height: 28,
                          duration: const Duration(milliseconds: 300),
                          child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              child: Icon(
                                Icons.question_mark_rounded,
                                size: isMouseEnter ? 28 : 24,
                              )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(child: SizedBox(child: YearSemesterDropDown())),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        FutureBuilder<List<Course>>(
          future: Future.value(courses), // Wrap the list in a Future
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(
                color: Color(0xFF00BD90),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final courses = snapshot.data ?? [];
              return Expanded(
              // return SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.699,
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
        const SizedBox(height: 18.55),
      ],
    );
  }
}
