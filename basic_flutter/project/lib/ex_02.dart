import 'package:flutter/material.dart';
void main() {
  runApp(MaterialApp(
      home: Container(
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.all(50),
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Center(
              child: Text(
                'CADT STUDENTS',
                style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
              ),
          ),
        ),
      ),
    ),
  );
}