import 'package:flutter/material.dart';

class Lookup extends StatelessWidget {
  const Lookup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create a SizedBox with a width of 45% of the screen width
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.45,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Include the SearchBar widget
          SearchBar(),
        ],
      ),
    );
  }
}