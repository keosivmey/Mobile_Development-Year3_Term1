import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HobbyCard(title: 'Travelling', icon: Icons.travel_explore, backgroundColor: Colors.green,),
            HobbyCard(title: 'Skating', icon: Icons.skateboarding,),
          ],
        ),
      ),
    ),
  ));
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? backgroundColor;

  const HobbyCard({super.key, required this.title, required this.icon, this.backgroundColor = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.all (Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding (
              padding: EdgeInsets.only(right: 20),
              child: Icon(icon, size: 50, color: Colors.white),
            ),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
