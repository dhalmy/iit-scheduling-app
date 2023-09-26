import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopNavBarLayout extends StatefulWidget {
  const TopNavBarLayout({super.key});

  @override
  State<TopNavBarLayout> createState() => _TopNavBarLayoutState();
}

class _TopNavBarLayoutState extends State<TopNavBarLayout> {
  final _pageController = PageController();
  bool pageIsScrolling = false;

  @override
  Widget build(BuildContext context) {
    double spacing = MediaQuery.of(context).size.height * 0.025; // 2.5% of the screen height for left, right, and bottom
    double topBarHeight = MediaQuery.of(context).size.height * 0.1; // 10% of the screen height for top bar

    void onScroll(double offset) {
      if (pageIsScrolling == false) {
        pageIsScrolling = true;
        if (offset > 0) {
          _pageController
              .nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);
          print('next page');
        } else {
          _pageController
              .previousPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut)
              .then((value) => pageIsScrolling = false);
          print('previous page');
        }
      }
    }

    List<Widget> pages = [
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3), // Make gray more transparent
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('svgs/Course_Selection_Icon.svg'),
            Text(
              'Course Selection',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black, // Change text color to black
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3), // Make gray more transparent
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('svgs/Tasks_Icon.svg'),
            Text(
              'Tasks',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black, // Change text color to black
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3), // Make gray more transparent
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('svgs/Today_Icon.svg'),
            Text(
              "Today",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black, // Change text color to black
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3), // Make gray more transparent
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('svgs/CASSIE_Icon.svg'),
            Text(
              'CASSIE',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black, // Change text color to black
              ),
            ),
          ],
        ),
      ),
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3), // Make gray more transparent
          borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('svgs/Settings_Icon.svg'),
            Text(
              'Settings',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black, // Change text color to black
              ),
            ),
          ],
        ),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          // White background for full-screen
          Container(
            color: Colors.white, // Change background color to white
            child: Column(
              children: [
                Container(
                  height: topBarHeight,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(0),
                        icon: SvgPicture.asset('svgs/Course_Selection_Icon.svg'),
                      ),
                      const Text('Course Selection'),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(1),
                        icon: SvgPicture.asset('svgs/Tasks_Icon.svg'),
                      ),
                      const Text('Tasks'),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(2),
                        icon: SvgPicture.asset("svgs/Today_Icon.svg"),
                      ),
                      const Text('Today'),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(3),
                        icon: SvgPicture.asset('svgs/CASSIE_Icon.svg'),
                      ),
                      const Text('CASSIE'),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(4),
                        icon: SvgPicture.asset('svgs/Settings_Icon.svg'),
                      ),
                      const Text('Settings'),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: double.infinity, // Take up the whole height
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}