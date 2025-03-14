import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<Map<String, dynamic>> transactions = [
    {"icon": Icons.apple, "name": "Apple Store", "category": "Entertainment", "amount": "- \$5,99"},
    {"icon": Icons.music_note, "name": "Spotify", "category": "Music", "amount": "- \$12,99"},
    {"icon": Icons.swap_horiz, "name": "Money Transfer", "category": "Transaction", "amount": "\$300"},
    {"icon": Icons.shopping_cart, "name": "Grocery", "category": "Shopping", "amount": "- \$88"},
    {"icon": Icons.apple, "name": "Apple Store", "category": "Entertainment", "amount": "- \$5,99"},
    {"icon": Icons.swap_horiz, "name": "Money Transfer", "category": "Transaction", "amount": "\$300"},
    {"icon": Icons.apple, "name": "Apple Store", "category": "Entertainment", "amount": "- \$5,99"},
    {"icon": Icons.music_note, "name": "Spotify", "category": "Music", "amount": "- \$12,99"},
  ];

  List<Map<String, dynamic>> filteredTransactions = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredTransactions = transactions; // Initial state with all items
    searchController.addListener(_filterSearchResults);
  }

  void _filterSearchResults() {
    String query = searchController.text.toLowerCase();
    setState(() {
      filteredTransactions = transactions.where((transaction) {
        return transaction['name'].toLowerCase().contains(query) ||
               transaction['category'].toLowerCase().contains(query);
      }).toList();
    });
  }

  Color getIconColor(String category) {
    switch (category) {
      case "Entertainment":
        return Colors.red;
      case "Music":
        return Colors.green;
      case "Transaction":
        return Colors.black;
      case "Shopping":
        return Colors.blue;
      case "Travel":
        return Colors.blueGrey;
      case "Fitness":
        return Colors.orange;
      case "Food & Drinks":
        return Colors.purple;
      default:
        return Colors.black;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.grey[300],
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: Text(
          "Search",
          style: TextStyle(color: Colors.black, fontFamily: 'Poppins'),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: filteredTransactions.length,
                itemBuilder: (context, index) {
                  final item = filteredTransactions[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(item['icon'], color: getIconColor(item['category'])),
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Poppins'),
                    ),
                    subtitle: Text(item['category'], style: TextStyle(color: Colors.grey)),
                    trailing: Text(
                      item['amount'],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
