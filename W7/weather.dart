import 'package:flutter/material.dart';

// Enum with image path inside for each seanson
enum Season {
  winter('assets/season_image/winter.jpg'),
  spring('assets/season_image/spring.jpg'),
  summer('assets/season_image/summer.jpg'),
  autumn('assets/season_image/autumn.jpg');

  final String imagePath; 
  const Season(this.imagePath); 
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seasons',
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          SeasonCard(country: 'France'),  
          SeasonCard(country: 'Cambodia'), 
        ],
      ),
    ),
  ));
}

// Stateful widget for each country card
class SeasonCard extends StatefulWidget {
  const SeasonCard({super.key, required this.country});
  final String country;

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentIndex = 0;

  void changeSeason() {
    setState(() {
      currentIndex = (currentIndex + 1) % Season.values.length; //Use enum values directly
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentSeason = Season.values[currentIndex];
    return GestureDetector(
      onTap: changeSeason,
      child: SizedBox(
        width: 250,
        height: 500,
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 400,
                width: 250,
                child: Image.asset(
                  currentSeason.imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              Text(widget.country, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }
}