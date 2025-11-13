import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const WeatherApp(), 
  ));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key}); 

  final List<CityWeather> cities = const [
    CityWeather(
      city: 'PhnomPenh',
      min: 10.0,
      max: 30.0,
      current: 12.2,
      asset: 'assets/assets_w5/ex4/cloudy.png',
      colors: GradientColors.phnompenh,
    ),
    CityWeather(
      city: 'Paris',
      min: 10.0,
      max: 40.0,
      current: 22.2,
      asset: 'assets/assets_w5/ex4/sunnyCloudy.png',
      colors: GradientColors.paris,
    ),
    CityWeather(
      city: 'Rome',
      min: 10.0,
      max: 40.0,
      current: 45.2,
      asset: 'assets/assets_w5/ex4/sunny.png',
      colors: GradientColors.rome,
    ),
    CityWeather(
      city: 'Toulouse',
      min: 10.0,
      max: 40.0,
      current: 45.2,
      asset: 'assets/assets_w5/ex4/veryCloudy.png',
      colors: GradientColors.toulous,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: Colors.blue[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (context, index) {
            return WeatherCard(weather: cities[index]);
          },
        ),
      ),
    );
  }
}

enum GradientColors {
  phnompenh(
    LinearGradient(
      colors: [Color.fromARGB(255, 227, 130, 245), Colors.purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  paris(
    LinearGradient(
      colors: [Color.fromARGB(255, 176, 253, 253), Colors.cyan],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  rome(
    LinearGradient(
      colors: [Color.fromARGB(255, 249, 157, 209), Colors.pinkAccent],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ),
  toulous(
    LinearGradient(
      colors: [Color.fromARGB(255, 249, 177, 126), Colors.orange],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  );

  final LinearGradient gradient;
  const GradientColors(this.gradient);
}

class CityWeather {
  final String city;
  final double min;
  final double max;
  final double current;
  final String asset;
  final GradientColors colors;

  const CityWeather({
    required this.city,
    required this.min,
    required this.max,
    required this.current,
    required this.asset,
    required this.colors,
  });
}

class WeatherCard extends StatelessWidget {
  final CityWeather weather;
  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: PhysicalModel(
        color: Colors.transparent,
        elevation: 6,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            gradient: weather.colors.gradient,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(weather.asset, width: 48, height: 48),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        weather.city, style: const TextStyle( fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white,),
                      ),
                      const SizedBox(height: 8),
                      tempStyle('Min', weather.min),
                      const SizedBox(height: 4),
                      tempStyle('Max', weather.max),
                    ],
                  ),
                ],
              ),
              Text(
                '${weather.current}°C', style: const TextStyle( fontSize: 22, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 253, 244, 244)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget tempStyle(String text, double temp) {
  return Row(
    children: [
      Text(text,
          style: const TextStyle(color: Color.fromARGB(255, 253, 244, 244))),
      const SizedBox(width: 5),
      Text('$temp°C',
          style: const TextStyle(color: Color.fromARGB(255, 253, 244, 244))),
    ],
  );
}