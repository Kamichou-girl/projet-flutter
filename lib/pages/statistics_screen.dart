import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/transaction_list.dart'; // Réutilisation du widget
import '../widgets/statistics_chart.dart'; // À créer
import 'K_stat_debts.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Statistics', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/welcom'),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text("Current Balance", style: TextStyle(color: Colors.grey, fontSize: 14)),
                  Text("\$8,545.00", style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),
            StatisticsChartWidget(), // À créer pour afficher le graphique
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Transaction", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {
                    Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => TransactionPage()),
);
                  },
                  child: Text("Sell All", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
            Expanded(child: TransactionList()), // Réutilisation du widget
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedIndex: 2,), // Réutilisation du widget
    );
  }
}
