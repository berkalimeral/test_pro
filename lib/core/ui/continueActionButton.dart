import 'package:flutter/material.dart';

class ContinueActionButton extends StatelessWidget {
  final String iconPath;
  final String buttonTitle;
  final Color iconColor;
  final int buttonColor;
  VoidCallback onPressed;

  ContinueActionButton({
    Key? key,
    required this.iconPath,
    required this.buttonTitle,
    required this.iconColor,
    required this.buttonColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      label: Text(
        buttonTitle,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      icon: Image.asset(
        iconPath,
        color: iconColor,
        height: 24,
        width: 24,
      ),
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(400, 50),
        padding: const EdgeInsets.symmetric(vertical: 12),
        primary: Color(buttonColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          side: BorderSide(
            color: Color(buttonColor),
          ),
        ),
      ),
      onPressed: onPressed,
    );
  }
}