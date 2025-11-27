
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  final TextEditingController controller = TextEditingController();

  double? fahrenheit;

  //Convert Celsius to Fahrenheit
  void convertTemperature(String value) {
    double? celsius = double.tryParse(value);
    if (celsius == null) {
      setState(() {
        fahrenheit = null; //reset if invalid input
      });
      return;
    }

    setState(() {
      fahrenheit = (celsius * 9 / 5) + 32;
    });
  }

  String result() {
    if (fahrenheit == null) {
      return "";
    } else {
      return "${fahrenheit!.toStringAsFixed(2)} °F";
    }
  }

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text("Temperature in Degrees:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            TextField(
              controller: controller,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              onChanged: convertTemperature, 
            ),
            const SizedBox(height: 30),
            const Text("Temperature in Fahrenheit:", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                result(),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
