import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(10.0), // Add padding to the container
      margin: const EdgeInsets.all(20.0), // Add margin around the container
      decoration: BoxDecoration(
        color: Colors.grey[200], // Set the background color to a light gray
        borderRadius: BorderRadius.circular(40.0), // Apply a border radius for rounded corners
      ),
      child: Row(
        children: [
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...', // Placeholder text for the search input
                border: InputBorder.none, // Remove the input border
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.zero, // Adjust the alignment to center vertically
            child: IconButton(
              icon: const Icon(Icons.search), // Search icon
              onPressed: () {
                // Implement your search functionality here
                _performSearch();
              },
            ),
          ),
        ],
      ),
    );
  }
}