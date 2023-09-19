import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/side_menu_layout.dart';
import 'package:iitschedulingapp/nav_bar/top_nav_bar.dart';
import 'dart:io' show Platform;

import 'package:iitschedulingapp/nav_bar/vertical_nav_bar.dart';

import '../insta/insta.dart';
import 'bottom_nav_bar.dart';
import 'home/first_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Widget navBarBuilder() {
    if (kIsWeb) {
      return const TopNavBarLayout();
    } else if (Platform.isAndroid || Platform.isIOS) {
      return const BottomNavBarLayout();
    } else {
      return const SideMenuLayout();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarBuilder(),
    );
  }
}
