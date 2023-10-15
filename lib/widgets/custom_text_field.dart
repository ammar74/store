import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,  required this.hintText, this.onChanged,this.inputType});

  final String hintText;
  Function(String)? onChanged;
  TextInputType? inputType;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextField(
        keyboardType: inputType,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: hintText,
          enabledBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          border:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
