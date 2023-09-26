import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/nav_bar.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the device dimensions and system UI offset
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceTopSystemUIOffset = MediaQuery.of(context).padding.top;
    minimumAppBarHeaderHeight = kToolbarHeight + deviceTopSystemUIOffset;

    return const MaterialApp(
      home: NavBar(),
      debugShowCheckedModeBanner: false, // Disable debug banner
    );
  }
}