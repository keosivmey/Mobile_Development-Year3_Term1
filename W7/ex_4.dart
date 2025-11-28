import 'package:flutter/material.dart';

void main() {
  runApp(MyScore());
}

class MyScore extends StatelessWidget {
  const MyScore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Score Cards',
      home: Scaffold(
        backgroundColor: Colors.lightGreen[200],
        body: Center(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: const [
              ScoreCard(subject: 'Flutter'),
              ScoreCard(subject: 'Dart'),
              ScoreCard(subject: 'React'),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String subject;
  const ScoreCard({super.key, required this.subject});

  String get cardTitle => 'My score in $subject';

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int currentScore = 0;

  // color base on score 
  Color barColor() {
    if (currentScore < 5) return Colors.green.shade300;
    if (currentScore < 8) return Colors.green.shade600;
    return Colors.green.shade900;
  }

  void increase() {
    setState(() {
      if (currentScore < 10) currentScore++;
    });
  }

  void decrease() {
    setState(() {
      if (currentScore > 0) currentScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.cardTitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: decrease,
                icon: const Icon(Icons.remove, color: Colors.black54, size: 28),
              ),
              IconButton(
                onPressed: increase,
                icon: const Icon(Icons.add, color: Colors.black54, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 12),
          //Progress bar using Stack
          SizedBox(
            height: 30,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                //fill bar based on score
                FractionallySizedBox(
                  widthFactor: currentScore / 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: barColor(),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}