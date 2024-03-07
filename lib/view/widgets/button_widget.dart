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
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(color: Colors.white),
          ),
        ),

        // height: 50,
        // child: ElevatedButton(
        //   style: ElevatedButton.styleFrom(
        //       shape:
        //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        //       backgroundColor: buttonColor,
        //       foregroundColor: Colors.white),
        //   onPressed: onPressed,
        //   child: Text(buttonName),
        // ),
      ),
    );
  }
}
