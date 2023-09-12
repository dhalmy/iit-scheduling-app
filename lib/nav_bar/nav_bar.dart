import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/home/side_menu_layout.dart';
import 'dart:io' show Platform;

import 'package:iitschedulingapp/nav_bar/vertical_nav_bar.dart';

import '../insta/insta.dart';
import 'home/first_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget navBarBuilder() {
    if (kIsWeb) {
      return const VerticalNavigationBar();
    } else if (Platform.isWindows) {
      return const SideMenuLayout();
    } else {
      return const VerticalNavigationBar();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarBuilder(),
    );
  }
}
