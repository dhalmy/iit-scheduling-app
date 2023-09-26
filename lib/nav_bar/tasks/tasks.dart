import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Tasks extends StatelessWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3), // Make gray more transparent
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset('svgs/Tasks_Icon.svg'),
          const Text(
            'Tasks',
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black, // Change text color to black
            ),
          ),
        ],
      ),
    );
  }
}