import 'package:flutter/material.dart';


class Lookup extends StatelessWidget {
  const Lookup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.4,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.3),
        // Background color with some transparency
        borderRadius: BorderRadius.circular(
            20.0), // Adjust the border radius as needed
      ),
      child: const Column(

        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Lookup", // Text displayed in the container
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black, // Text color set to black
            ),
          ),
          SearchBar(), // Include the SearchBar widget
        ],
      ),
    );
  }
}