// import 'dart:math';
 import 'package:flutter/material.dart';

// class DiceRoller extends StatefulWidget {
//   const DiceRoller({super.key});

//   @override
//   State<DiceRoller> createState() => _DiceRollerState();
// }

// class _DiceRollerState extends State<DiceRoller> {
//   final Random random = Random();

//   final List<String> diceImages = [
//     'assets/image_w7/dice-1.png',
//     'assets/image_w7/dice-2.png',
//     'assets/image_w7/dice-3.png',
//     'assets/image_w7/dice-4.png',
//     'assets/image_w7/dice-5.png',
//     'assets/image_w7/dice-6.png',
//   ];

//   String activeDiceImage = 'assets/image_w7/dice-2.png';

//   void rollDice() {
//     setState(() {
//       activeDiceImage = diceImages[random.nextInt(diceImages.length)];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Image.asset(activeDiceImage, width: 200),
//         const SizedBox(height: 20),
//         TextButton(
//           onPressed: rollDice,
//           child: const Text(
//             'Roll Dice',
//             style: TextStyle(fontSize: 28, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }

// void main() => runApp(
//       const MaterialApp(
//         home: Scaffold(
//           backgroundColor: Colors.deepPurple,
//           body: Center(child: DiceRoller()),
//         ),
//       ),
//     );



void main() => runApp(
  const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DiscountCard(initialPrice: 500, discountRace: 0.25),
            DiscountCard(initialPrice: 100, discountRace: 0.10),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends StatefulWidget {
  const DiscountCard({
    super.key,
    required this.initialPrice,
    required this.discountRace,
  });

  final int initialPrice;

  final double discountRace; // From 0 to 1 . Example 0.25 = 25%

  @override
  State<DiscountCard> createState() => _DiscountCardState();
}

class _DiscountCardState extends State<DiscountCard> {
  bool discountApplied = false;

  Color get backgroundColor => discountApplied ? Colors.pink : Colors.black;

  String get labelText => discountApplied ? "Discount!" : "No Discount";

  String get buttonLabel => discountApplied ? "Cancel Discount" : "Apply Discount";

  int get effectivePrice => discountApplied
      ? (widget.initialPrice * (1 - widget.discountRace)).floor()
      : widget.initialPrice;

  String get priceLabel => "\$ $effectivePrice";

  void onDiscount() {
    setState(() {
      discountApplied = !discountApplied;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(priceLabel, style: TextStyle(color: Colors.white)),
          Text(labelText, style: TextStyle(color: Colors.white)),
          ElevatedButton(
            onPressed: onDiscount,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
            ),
            child: Text(buttonLabel),
          ),
        ],
      ),
    );
  }
}
