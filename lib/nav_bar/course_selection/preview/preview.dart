import 'package:flutter/material.dart';

import 'list_week_tab_bar/list_week_tab_bar.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a Container with a width of 45% of the screen width
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display the "Preview" text with specified style
          // Text(
          //   "Preview",
          //   style: TextStyle(
          //     fontSize: 18.0,
          //     color: Colors.black, // Set text color to black
          //   ),
          // ),
          ListWeekTabBar(),
        ],
      ),
    );
  }
}