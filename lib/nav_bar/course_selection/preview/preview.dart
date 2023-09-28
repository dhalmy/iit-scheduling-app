import 'package:flutter/material.dart';

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
        color:
            Colors.grey.withOpacity(0.3), // Make gray more transparent
        borderRadius: BorderRadius.circular(
            20.0), // Adjust the radius as needed
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Preview",
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