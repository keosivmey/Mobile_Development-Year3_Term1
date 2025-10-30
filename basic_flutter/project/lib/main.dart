import 'package:flutter/material.dart';
import 'grandiant_button.dart';

void main () {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Column(
          children: [ 
            GradiantButton(text: "Hello 1", start: Colors.blue, end: Colors.red),
            GradiantButton(text: "Hello 2", start: Colors.blue, end: Colors.red),
            GradiantButton(text: "Hello 3", start: Colors.blue, end: Colors.red),
          ],
        ),
      ),
      ),
    ),
  );
}