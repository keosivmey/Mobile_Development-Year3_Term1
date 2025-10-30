 import 'package:flutter/material.dart';

void main () { 
  runApp(MaterialApp(
    home: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        children: [ 
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'OOP',
                style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue[300],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'DART',
                style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
              ),
            ),
          ),
        Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[300]!, Colors.blue[900]!],
                ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'FLUTTER',
                style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
              ),
            ),
        ),
    ])

  ),
  ),
  );
}