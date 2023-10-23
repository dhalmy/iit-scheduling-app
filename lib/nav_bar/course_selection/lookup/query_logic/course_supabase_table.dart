import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_logic/supabase_table.dart';

class CourseSupabaseTable implements SupabaseTable {
  const CourseSupabaseTable();

  @override
  String get tableName => "user";

  String get idColumn => "id";
  String get idFirstName => "first_name";
  String get idLastName => "last_name";
}