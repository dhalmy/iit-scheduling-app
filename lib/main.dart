import 'package:flutter/material.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/selected_courses.dart';
import 'package:iitschedulingapp/nav_bar/nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  String SUPABASEURL = dotenv.env['SUPABASE_URL'] ?? "url not found";
  String ANONKEY = dotenv.env['SUPABASE_ANON_KEY'] ?? "key not found";

    await Supabase.initialize(
    url: SUPABASEURL,
    anonKey: ANONKEY,
  );
  // runApp(const MyApp());
  runApp(ChangeNotifierProvider(
    create: (context) => SelectedCourses(),
    child: const MyApp(),
  ));
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
