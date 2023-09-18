import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

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
            Icon(Icons.schedule, size: 50.0, color: Colors.blue),
            Text(
              'Class Schedule',
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
            Icon(Icons.assignment, size: 50.0, color: Colors.green),
            Text(
              'Assignments',
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
            Icon(Icons.notifications, size: 50.0, color: Colors.orange),
            Text(
              'Notifications',
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
            Icon(Icons.person, size: 50.0, color: Colors.purple),
            Text(
              'Profile',
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
                        icon: const Icon(Icons.schedule),
                      ),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(1),
                        icon: const Icon(Icons.assignment),
                      ),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(2),
                        icon: const Icon(Icons.notifications),
                      ),
                      IconButton(
                        onPressed: () => _pageController.jumpToPage(3),
                        icon: const Icon(Icons.person),
                      ),
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