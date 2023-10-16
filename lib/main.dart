import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/nav_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://hojaypiafpzmnznbilgm.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImhvamF5cGlhZnB6bW56bmJpbGdtIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTYxNzQ3ODcsImV4cCI6MjAxMTc1MDc4N30.HTuzXegPGHO-ZE6etRg9BtL5W7nAUP6QdIcRGA2Stlg',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize constants only if they haven't been set yet
    if (deviceHeight == -1) {
      // Get device dimensions and system UI offset using MediaQuery
      final mediaQuery = MediaQuery.of(context);
      deviceHeight = mediaQuery.size.height;
      deviceWidth = mediaQuery.size.width;
      deviceTopSystemUIOffset = mediaQuery.padding.top;
      // Calculate the minimum app bar header height
      minimumAppBarHeaderHeight = kToolbarHeight + deviceTopSystemUIOffset;
    }

    // Create and return the MaterialApp widget
    return const MaterialApp(
      home: NavBar(),
      debugShowCheckedModeBanner: false, // Disable debug banner
    );
  }
}