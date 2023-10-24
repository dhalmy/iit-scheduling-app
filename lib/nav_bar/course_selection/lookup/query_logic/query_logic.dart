import 'package:enum_to_string/enum_to_string.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_logic/search_keywords.dart';
import 'package:iitschedulingapp/nav_bar/course_selection/lookup/query_logic/user_search_input.dart';

import '../year_semester_drop_down/year_semester.dart';

class QueryLogic {
  final UserSearchInput userInput;
  final YearSemester yearSemester; // Replace with the actual type you are using

  QueryLogic(this.userInput, this.yearSemester);

  int _findPatternCount(String input) {
    int csCount = input.split('cs:').length - 1;
    int cnCount = input.split('cn:').length - 1;
    int iCount = input.split('i:').length - 1;

    switch (csCount + cnCount + iCount) {
      case 0:
        return 0; // None of the patterns found
      case 1:
        if (csCount == 1) {
          return 5; // "cs:" found
        } else if (cnCount == 1) {
          return 3; // "cn:" found
        } else {
          return 1; // "i:" found
        }
      case 2:
        if (csCount == 1 && cnCount == 1) {
          return 8; // "cs:" and "cn:" found
        } else if (cnCount == 1 && iCount == 1) {
          return 4; // "cn:" and "i:" found
        } else {
          return 6; // "cs:" and "i:" found
        }
      default:
        return 9; // All three patterns found
    }
  }

  Map<SearchKeywords, String> _pairKeyValues(UserSearchInput userSearchInput) {
    // Split the user input string by spaces
    List<String> parts = userSearchInput.getUserInput.split(' ');

    // Initialize a map to store key-value pairs
    Map<SearchKeywords, String> keyValuePairs = {};

    // Iterate through the parts of the input
    for (int i = 0; i < parts.length; i += 2) {
      if (i + 1 < parts.length) {
        // Extract the key and value and remove the trailing ':'
        String keyString = parts[i].replaceAll(':', '');
        String value = parts[i + 1];

        // Convert the keyString to a SearchKeywords enum value
        SearchKeywords key;
        switch (keyString) {
          case 'cs':
            key = SearchKeywords.courseSubject;
            break;
          case 'cn':
            key = SearchKeywords.courseNumber;
            break;
          case 'i':
            key = SearchKeywords.instructor;
            break;
          default:
            key = SearchKeywords.unknown;
            break;
        }
        keyValuePairs[key] = value;
      }
    }

    return keyValuePairs;
  }

  // cs: math cn: 374 i: lubin
  Map<SearchKeywords, UserSearchInput> parsedUserInput() {
    Map<SearchKeywords, UserSearchInput> organized = {};
    int patternCount = _findPatternCount(userInput.getUserInput);
    Map<SearchKeywords, String> keyValues = _pairKeyValues(userInput);
    print(patternCount);
    print(keyValues);
    return organized;
  }
}