import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../query_logic/query_logic.dart';
import '../query_logic/user_search_input.dart';
import '../year_semester_drop_down/year_semester.dart';

class QueryBox extends StatefulWidget {
  const QueryBox({Key? key}) : super(key: key);

  @override
  State<QueryBox> createState() => _QueryBoxState();
}

class _QueryBoxState extends State<QueryBox> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          0.30, // Set the width of the search bar
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.all(20.0), // Add margin around the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
            40.0), // Apply a border radius for rounded corners
        border: Border.all(color: Colors.grey, width: 1.0), // Add a grey border
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 12),
                hintText: 'Search...', // Placeholder text for the search input
                border: InputBorder.none, // Remove the input border
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search), // Search icon
            onPressed: () {
              final query = _searchController.text;
              final userInput = UserSearchInput(query);
              final queryLogic = QueryLogic(userInput, YearSemester.year2023Fall);
              queryLogic.parsedUserInput();
            },
          ),
        ],
      ),
    );
  }
}
