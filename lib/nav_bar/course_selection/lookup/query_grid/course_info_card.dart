import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/grid_svg_icon_logic.dart';
import 'package:provider/provider.dart';

import '../../selected_courses.dart';
import '../query_logic/course.dart';
import 'evaluations/rate_my_professor.dart';
import 'evaluations/rate_my_professor_logic.dart';

class CourseInfoCard extends StatefulWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseInfoCard({
    Key? key,
    required this.course,
    required this.isSmallWidget,
  }) : super(key: key);

  @override
  State<CourseInfoCard> createState() => _CourseInfoCardState();
}

class _CourseInfoCardState extends State<CourseInfoCard> {
  // Initialize RateMyProfessor with default values
  RateMyProfessor rateMyProfessor = RateMyProfessor(
    firstName: '',
    lastName: '',
    rating: 0,
    numReviews: 0,
    pwta: 0,
    difficulty: 0,
  );

  @override
  void initState() {
    super.initState();
    // Fetch RateMyProfessor data when the widget is created
    fetchRateMyProfessorData();
  }

  Future<void> fetchRateMyProfessorData() async {
    // Split instructor's name
    String instructorName = widget.course.instructor;
    List<String> nameParts = instructorName.split(', ');

    // Assuming the name is in the format "Last, First"
    String lastName = nameParts.isNotEmpty ? nameParts[0] : '';
    String firstName = nameParts.length > 1 ? nameParts[1] : '';

    // Create RateMyProfessorLogic instance with first and last names
    final logic = RateMyProfessorLogic(firstName, lastName);

    // Fetch RateMyProfessor data
    final rmpData = await logic.getRMPData();

    // Update the state with fetched RateMyProfessor data
    setState(() {
      rateMyProfessor = rmpData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.isSmallWidget ? 125 : 154,
      width: widget.isSmallWidget ? 205 : 258,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    child: Text(
                      widget.course.courseCode,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: widget.isSmallWidget ? 20 : 30,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    final selectedCoursesProvider =
                    context.read<SelectedCourses>();
                    selectedCoursesProvider.addCourse(
                      "${widget.course.courseCode} ${widget.course.courseTitle} - ${widget.course.instructor} ~ ${widget.course.days} ${widget.course.time}",
                    );
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.add,
                        size: widget.isSmallWidget ? 20 : 30,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
              overflow: TextOverflow.ellipsis,
              maxLines: widget.isSmallWidget ? 2 : 3,
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 1),
                    SizedBox(
                      child: Row(
                        children: [
                          Text('Enrolled: ${widget.course.enrolled}/${widget.course.max}', style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
                          const SizedBox(width: 2),
                          GridSvgIconLogic().getSectionsIcon(
                              widget.course.enrolled, widget.course.max),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text('Prerequisites >'),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(height: 1),
                    SizedBox(
                      child: Row(
                        children: [
                          Text('RMP: ${rateMyProfessor.rating}/5 (${rateMyProfessor.numReviews})', style: TextStyle(fontSize: widget.isSmallWidget ? 10 : 12)),
                          const SizedBox(width: 2),
                          GridSvgIconLogic().getSectionsIcon(
                              widget.course.enrolled, widget.course.max),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Row(
                      textDirection: TextDirection.ltr,
                      children: [
                        Text('Catalog >'),
                      ],
                    ),
                    const SizedBox(height: 1),
                    // Evaluations(rateMyProfessor: rateMyProfessor),
                    // const Text('Catalog >'),
                  ],
                ),
              ],
            ),
            // Add more Text widgets for other course details as needed
          ],
        ),
      ),
    );
  }
}