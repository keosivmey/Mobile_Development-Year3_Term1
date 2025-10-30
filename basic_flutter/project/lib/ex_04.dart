import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(40),

        child: Column(
          children: [
            CustomCard(text: 'OOP', color: Colors.blue[100],),
            CustomCard(text: 'Dart', color: Colors.blue[300]),
            CustomCard(text: 'Flutter', gradient: LinearGradient(colors: [Colors.blue.shade300, Colors.blue.shade900])),
          ],
        ),
      ),
    ),
  );
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;
  const CustomCard({super.key, required this.text, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: gradient == null? color: null,
        gradient: gradient
      ),
      child: Center(
        child: Text(text, style: TextStyle(color: Colors.white, decoration: TextDecoration.none), ),
      ),
    );
  }
}