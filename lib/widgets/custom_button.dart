import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key,this.onTap, required this.buttonText});

  final String buttonText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0
        ),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Center(
          child: Text(
            buttonText,
            style:const TextStyle(
              fontSize: 22,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}