import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/nav_bar.dart';
import 'package:iitschedulingapp/search_bar/search_bar_web.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    deviceTopSystemUIOffset = MediaQuery.of(context).padding.top;
    minimumAppBarHeaderHeight = kToolbarHeight + deviceTopSystemUIOffset;
    return const MaterialApp(
      home: NavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
  }