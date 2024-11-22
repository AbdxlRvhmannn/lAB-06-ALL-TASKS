// TASK 3




import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final List<Map<String, String>> cardsData = [
    {'title': 'Statistics', 'description': 'View your statistics'},
    {'title': 'Notifications', 'description': 'Check recent notifications'},
    {'title': 'Messages', 'description': 'View your messages'},
    {'title': 'Settings', 'description': 'Change your settings'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard',),
        centerTitle: true,),
      body: GridView.builder(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemCount: cardsData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Action when card is tapped
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Tapped on ${cardsData[index]['title']}')),
              );
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.dashboard, size: 50, color: Colors.blue),
                    SizedBox(height: 10),
                    Text(
                      cardsData[index]['title']!,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      cardsData[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: Dashboard()));
}
