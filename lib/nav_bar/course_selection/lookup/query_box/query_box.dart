import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  // Function to perform the search when Enter key is pressed or search button is clicked
  void _performSearch() {
    final searchTerm = _searchController.text;
    // Handle the search functionality here
    // This function will be called when the search button is pressed or the Enter key is pressed.
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.30, // Set the width of the search bar
      height: MediaQuery.of(context).size.height * 0.05,
      margin: const EdgeInsets.all(20.0), // Add margin around the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0), // Apply a border radius for rounded corners
        border: Border.all(color: Colors.grey, width: 1.0), // Add a grey border
      ),
      child: Row(
        children: [
          const SizedBox(width: 12,),
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: 12),
                hintText: 'Search...', // Placeholder text for the search input
                border: InputBorder.none, // Remove the input border
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search), // Search icon
            onPressed: () {
              // Implement your search functionality here
              _performSearch();
            },
          ),
        ],
      ),
    );
  }
}