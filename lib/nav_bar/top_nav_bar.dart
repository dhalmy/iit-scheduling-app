import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iitschedulingapp/constants.dart';
import 'package:iitschedulingapp/nav_bar/cassie/cassie.dart';
import 'package:iitschedulingapp/nav_bar/settings/settings.dart';
import 'package:iitschedulingapp/nav_bar/tasks/tasks.dart';
import 'package:iitschedulingapp/nav_bar/today/today.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/course_selection.dart';

class TopNavBarLayout extends StatefulWidget {
  const TopNavBarLayout({super.key});

  @override
  State<TopNavBarLayout> createState() => _TopNavBarLayoutState();
}

class _TopNavBarLayoutState extends State<TopNavBarLayout> {
  final _pageController = PageController();
  bool pageIsScrolling = false;

  // Function to handle horizontal scrolling between pages
  void onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        _pageController
            .nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      } else {
        _pageController
            .previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut)
            .then((value) => pageIsScrolling = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final double spacing = MediaQuery.of(context).size.height * 0.025;
    final double topBarHeight = MediaQuery.of(context).size.height * 0.1;

    // List of pages to display in the navigation bar
    List<Widget> pages = [
      const CourseSelection(),
      const Tasks(),
      const Today(),
      const CASSIE(),
      const Settings(),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // White background for full-screen
          Container(
            color: Colors.white, // Change background color to white
            child: Column(
              children: [
                SizedBox(
                  height: topBarHeight,
                  child: Row(
                    children: [
                      SizedBox(width: spacing), // Add left spacing
                      for (int index = 0; index < pages.length; index++)
                        _buildNavItem(index, pages[index]),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height - topBarHeight,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      onScroll(details.delta.dx); // Scroll left and right
                    },
                    child: Listener(
                      onPointerSignal: (pointerSignal) {
                        if (pointerSignal is PointerScrollEvent) {
                          onScroll(pointerSignal.scrollDelta.dx); // Scroll left and right
                        }
                      },
                      child: PageView.builder(
                        itemCount: pages.length,
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.only(left: spacing, right: spacing, bottom: spacing), // Add spacing to left, right, and bottom
                            child: pages[index],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to build navigation bar items
  Widget _buildNavItem(int index, Widget page) {
    final List<Map<String, dynamic>> navItems = [
      {
        'iconPath': 'svgs/Course_Selection_Icon.svg',
        'label': 'Course Selection',
      },
      {
        'iconPath': 'svgs/Tasks_Icon.svg',
        'label': 'Tasks',
      },
      {
        'iconPath': 'svgs/Today_Icon.svg',
        'label': 'Today',
      },
      {
        'iconPath': 'svgs/CASSIE_Icon.svg',
        'label': 'CASSIE',
      },
      {
        'iconPath': 'svgs/Settings_Icon.svg',
        'label': 'Settings',
      },
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.15,
      child: InkWell(
        onTap: () => _pageController.jumpToPage(index),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(navItems[index]['iconPath'], height: MediaQuery.of(context).size.height * 0.04,),
            SizedBox(width: MediaQuery.of(context).size.width * 0.01), // Adjust the spacing between the icon and label
            Text(
              navItems[index]['label'],
              style: const TextStyle(
                color: Colors.black, // Set the text color to black
              ),
            ),
          ],
        ),
      ),
    );
  }
}