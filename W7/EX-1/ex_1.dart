import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SelectedButton(),
              SelectedButton(),
              SelectedButton(),
            ],
              ),
        ),
      ),
    ));

class SelectedButton extends StatefulWidget {
  const SelectedButton({super.key, });

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

  class _SelectedButtonState extends State<SelectedButton> {
    bool isSelected = false;
    
    // Getters to get background color, button text and text color based on isSelected state
    Color get backgroundColor => isSelected ? Colors.blue.shade500 : Colors.blue.shade50;
    String get buttonText => isSelected ? "Selected" : "Not Selected";
    Color get textColour => isSelected ? Colors.white : Colors.black;

    void handleSelected() {
      setState(() {
        isSelected = !isSelected;
      });
    }

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor),
            onPressed: handleSelected,
          child: Center(
            child: Text(buttonText, style: TextStyle(color: textColour),),
         ),
      ),
      );
  }
}



