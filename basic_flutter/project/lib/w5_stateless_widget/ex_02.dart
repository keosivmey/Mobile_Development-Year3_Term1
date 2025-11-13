import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: 'Submit', 
                icon: Icons.done
                ),
              CustomButton(
                label: 'Time',
                icon: Icons.timer,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              CustomButton(
                label: 'Account', 
                icon: Icons.account_circle,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
                ),
            ],
          ),
        ),
      ),
    ),
  );
}

enum IconPosition { left, right }
enum ButtonType { primary, secondary, disabled }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  Color get background {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconPosition == IconPosition.left)
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(icon, color: Colors.grey[800], size: 50),
              ),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
            if (iconPosition == IconPosition.right)
              Padding(  
                padding: EdgeInsets.only(left: 10),
                child: Icon(icon, color: Colors.grey[800], size: 50),
              ),
          ],
        ),
      ),
    );
  }
}