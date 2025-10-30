import 'package:flutter/material.dart';
void main() {
   runApp(
    
     const MaterialApp(
      home: Scaffold (
        body: Center(
          child: Text(
            'Hello my name is Sivmey', 
            style: TextStyle(color: Colors.orange, fontSize: 30),
          ), //child text
        ), //body center
      ), //scaffold
     ), //MaterialApp
    );
}