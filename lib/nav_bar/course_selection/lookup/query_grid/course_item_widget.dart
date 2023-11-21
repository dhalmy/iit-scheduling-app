import 'package:flutter/material.dart';
import 'package:iitschedulingapp/hover_builder.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/grid_svg_icon_logic.dart';
import 'package:provider/provider.dart';

import '../../selected_courses.dart';
import '../query_logic/course.dart';
import 'evaluations/rate_my_professor.dart';
import 'evaluations/rate_my_professor_logic.dart';

class CourseItemWidget extends StatefulWidget {
  final Course course;
  final bool isSmallWidget;

  const CourseItemWidget({
    Key? key,
    required this.course,
    required this.isSmallWidget,
  }) : super(key: key);

  @override
  State<CourseItemWidget> createState() => _CourseItemWidgetState();
}

class _CourseItemWidgetState extends State<CourseItemWidget> {
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
    // Print the original instructor's name
    print('widget.course.instructor: ${widget.course.instructor}');

    // Split instructor's name
    String instructorName = widget.course.instructor;
    List<String> nameParts = instructorName.split(', ');

    // Assuming the name is in the format "Last, First"
    String lastName = nameParts.length > 0 ? nameParts[0] : '';
    String firstName = nameParts.length > 1 ? nameParts[1] : '';

    // Create RateMyProfessorLogic instance with first and last names
    final logic = RateMyProfessorLogic(firstName, lastName);

    // Fetch RateMyProfessor data
    final rmpData = await logic.getRMPData();
    print(rmpData.rating);
    print(rmpData.numReviews);

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
              maxLines: widget.isSmallWidget ? 3 : 4,
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
                          const Text('Sections'),
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
                        Text('Prerequisites'),
                        Icon(
                          Icons.question_mark_outlined,
                          size: 13,
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Catalog >'),
                    HoverBuilder(builder: (isHovering) {
                      if (isHovering) {
                        fetchRateMyProfessorData();
                      }
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Text(
                            'Evaluations >',
                            style: TextStyle(
                              fontWeight: isHovering
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                              fontSize: isHovering ? 16 : 14,
                            ),
                          ),
                          Positioned(
                            bottom: -30,
                            left: 0,
                            right: -20,
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              height: isHovering ? 50 : 0,
                              width: isHovering ? 40 : 0,
                              child: ClipRect(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Column(
                                          children: [
                                            RichText(text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Rate My Professor\n',
                                                  style: const TextStyle(
                                                      decoration:
                                                      TextDecoration.underline,
                                                    ),
                                                  children: [
                                                    TextSpan(
                                                      text: '${rateMyProfessor.rating} / 5.0 \n${rateMyProfessor.numReviews} reviews',
                                                      style: const TextStyle(
                                                        decoration: TextDecoration.none,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                // TextSpan(
                                                //   text: '${rateMyProfessor.rating} / 5.0',
                                                //   style: TextStyle(
                                                //     color: Colors.black,
                                                //   ),
                                                // ),
                                              ],
                                            )),
                                            // const Text(
                                            //   'Rate My Professor',
                                            //   style: TextStyle(
                                            //     decoration:
                                            //     TextDecoration.underline,
                                            //   ),
                                            // ),
                                            // Text(
                                            //   '${rateMyProfessor.rating} / 5.0 \n${rateMyProfessor.numReviews} reviews',
                                            //   overflow: TextOverflow.ellipsis,
                                            // ),
                                          ],
                                        ),
                                        // Add more properties as needed
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
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
