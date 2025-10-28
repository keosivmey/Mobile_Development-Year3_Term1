 import 'package:flutter/material.dart';

// Exercise1
// void main() {
//    runApp(
    
//      const MaterialApp(
//       home: Scaffold (
//         body: Center(
//           child: Text(
//             'Hello my name is Sivmey', 
//             style: TextStyle(color: Colors.orange, fontSize: 30),
//           ), //child text
//         ), //body center
//       ), //scaffold
//      ), //MaterialApp
//     );
         
// }


//Exercise 2
// void main() {
//   runApp(MaterialApp(
//       home: Container(
//           padding: EdgeInsets.all(40),
//           margin: EdgeInsets.all(50),
//           color: Colors.blue[300],
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.blue[600],
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: Center(
//               child: Text(
//                 'CADT STUDENTS',
//                 style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
//               ),
//           ),
//         ),
//       ),
//     ),
//   );
// }


//exercise 3
// void main () { 
//   runApp(MaterialApp(
//     home: Container(
//       padding: EdgeInsets.all(40),
//       child: Column(
//         children: [ 
//           Container(
//             margin: EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.blue[100],
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: Center(
//               child: Text(
//                 'OOP',
//                 style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
//               ),
//             ),
//           ),
//           Container(
//             margin: EdgeInsets.only( bottom: 20),
//             decoration: BoxDecoration(
//               color: Colors.blue[300],
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: Center(
//               child: Text(
//                 'DART',
//                 style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
//               ),
//             ),
//           ),
//         Container(
//             margin: EdgeInsets.only( bottom: 20),
//             decoration: BoxDecoration(
//               //color: Colors.blue[600],
//               gradient: LinearGradient(
//                   colors: [Colors.blue[300]!, Colors.blue[900]!],
//                 ),
//               borderRadius: BorderRadius.all(Radius.circular(20)),
//             ),
//             child: Center(
//               child: Text(
//                 'FLUTTER',
//                 style: TextStyle(color: Colors.white, fontSize: 30, decoration: TextDecoration.none),
//               ),
//             ),
//         ),
//     ])

//   ),
//   ),
//   );
// }

//exercise 4

void main() {
  runApp(const MaterialApp(
    home: MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      child: const Column(
        children: [
          CustomCard(
            text: 'OOP',
            color: Color(0xFFBBDEFB), // because of const we can't use Colors.blue[100] cuz it's not constant
          ),
          CustomCard(
            text: 'DART',
            color: Color(0xFF64B5F6), //same
          ),
          CustomCard(
            text: 'FLUTTER',
            gradient: LinearGradient(
              colors: [
              Color(0xFF1E88E5), //same 
              Color(0xFF0D47A1), // blue[900]
              ],
            ),
  
          ),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final Gradient? gradient;

  const CustomCard({
    super.key,
    required this.text,
    this.color = Colors.blue,
    this.gradient
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: gradient == null ? color : null, // use color if no gradient
        gradient: gradient, // otherwise use gradient
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
