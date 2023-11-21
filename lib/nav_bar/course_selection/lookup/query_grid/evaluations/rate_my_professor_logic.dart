import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_grid/evaluations/rate_my_professor.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RateMyProfessorLogic {
  final String firstName;
  final String lastName;

  RateMyProfessorLogic(this.firstName, this.lastName);

  Future<RateMyProfessor> getRMPData() async {
    final data = await Supabase.instance.client
        .from('ratemyprofessor')
        .select('*')
        .eq('first_name', firstName).eq('last_name', lastName)
        .execute();
    final rmpData = data.data as List;
    // print(RateMyProfessor.fromJson(rmpData[0]).firstName);
    // print(RateMyProfessor.fromJson(rmpData[0]).lastName);
    print(RateMyProfessor.fromJson(rmpData[0]).rating);
    print(RateMyProfessor.fromJson(rmpData[0]).numReviews);
    // print(RateMyProfessor.fromJson(rmpData[0]).pwta);
    // print(RateMyProfessor.fromJson(rmpData[0]).difficulty);
    return rmpData.isNotEmpty ? RateMyProfessor.fromJson(rmpData[0]) : RateMyProfessor(firstName: '', lastName: '', rating: 0, numReviews: 0, pwta: 0, difficulty: 0);
  }
}

// supabase: Client = create_client(url, key)
// data = supabase.table('ratemyprofessor').select("*").eq('first_name', self.first).eq('last_name', self.last).execute()
// if data.data:
// self.rating = data.data[0]['rating']
// self.difficulty = data.data[0]['difficulty']
// self.pwta = data.data[0]['pwta']
// self.numreviews = data.data[0]['numreviews']
// else:
// print("This professor is not on RMP")