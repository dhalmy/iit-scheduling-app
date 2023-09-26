import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/side_menu_layout.dart';
import 'package:iitschedulingapp/nav_bar/top_nav_bar.dart';
import 'dart:io' show Platform;

import 'bottom_nav_bar.dart';
import 'custom_navbar.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // Function to build the appropriate navigation bar layout based on the platform
  Widget navBarBuilder() {
    if (kIsWeb) {
      return const TopNavBarLayout(); // For web, use the top navigation bar
    } else if (Platform.isAndroid || Platform.isIOS) {
      return const BottomNavBarLayout(); // For Android and iOS, use the bottom navigation bar
      // return const CustomNavBar(); // Optionally, use a custom navigation bar
    } else {
      return const SideMenuLayout(); // For other platforms, use a side menu layout
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarBuilder(), // Build the selected navigation bar layout
    );
  }
}