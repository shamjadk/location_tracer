import 'package:flutter/material.dart';

class ButtonWIdget extends StatelessWidget {
  final Color buttonColor;
  final String buttonName;
  final VoidCallback onPressed;
  const ButtonWIdget(
      {super.key,
      required this.buttonName,
      required this.onPressed,
      required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, foregroundColor: Colors.white),
      child: Text(buttonName),
      onPressed: onPressed,
    );
  }
}
