import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iitschedulingapp/nav_bar/cassie/cassie.dart';
import 'package:iitschedulingapp/nav_bar/settings/settings.dart';
import 'package:iitschedulingapp/nav_bar/tasks/tasks.dart';
import 'package:iitschedulingapp/nav_bar/today/today.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/course_selection.dart';

class TopNavBarLayout extends StatefulWidget {
  const TopNavBarLayout({Key? key}) : super(key: key);

  @override
  State<TopNavBarLayout> createState() => _TopNavBarLayoutState();
}

class _TopNavBarLayoutState extends State<TopNavBarLayout> {
  static const double spacing = 16.0;
  static const double topBarHeightFactor = 0.08;
  static const double iconSizeFactor = 0.04;
  static const double topPadding = 8.0;

  final _pageController = PageController();
  bool pageIsScrolling = false;
  int selectedIndex = 0; // Store the selected index

  List<Widget> pages = [
    const CourseSelection(),
    const Tasks(),
    const Today(),
    const CASSIE(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    // Calculate the top bar height based on screen dimensions
    final double topBarHeight = MediaQuery.of(context).size.height * topBarHeightFactor;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Column(
              children: [
                // Top navigation bar with icons and labels
                SizedBox(
                  height: topBarHeight,
                  child: ListView.builder(
                    itemCount: pages.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildNavItem(index);
                    },
                  ),
                ),
                // Content area with horizontal scrolling pages
                SizedBox(
                  height: MediaQuery.of(context).size.height - topBarHeight,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      onScroll(details.delta.dx);
                    },
                    child: Listener(
                      onPointerSignal: (pointerSignal) {
                        if (pointerSignal is PointerScrollEvent) {
                          onScroll(pointerSignal.scrollDelta.dx);
                        }
                      },
                      child: PageView.builder(
                        itemCount: pages.length,
                        controller: _pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return _buildPage(index);
                        },
                        onPageChanged: (index) {
                          // Update the selected index when the page changes
                          setState(() {
                            selectedIndex = index;
                          });
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

  Widget _buildNavItem(int index) {
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

    return InkWell(
      onTap: () {
        _pageController.jumpToPage(index);
        setState(() {
          selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: topPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: spacing),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: index == selectedIndex ? const Color(0xFF00BD90) : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    navItems[index]['iconPath'],
                    height: MediaQuery.of(context).size.height * iconSizeFactor,
                  ),
                  const SizedBox(width: spacing),
                  Text(
                    navItems[index]['label'],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 21,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: spacing * 2.5),
          ],
        ),
      ),
    );
  }

  // Build the page content
  Widget _buildPage(int index) {
    return Container(
      margin: const EdgeInsets.all(spacing),
      child: pages[index],
    );
  }

  // Handle horizontal scrolling between pages
  void onScroll(double offset) {
    if (pageIsScrolling == false) {
      pageIsScrolling = true;
      if (offset > 0) {
        _pageController
            .nextPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
            .then((value) => pageIsScrolling = false);
      } else {
        _pageController
            .previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
            .then((value) => pageIsScrolling = false);
      }
    }
  }
}