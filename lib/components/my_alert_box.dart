import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {

  final controller; 
  final String  hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const MyAlertBox({
    Key? key, 
    this.controller, 
    required this.onSave, 
    required this.onCancel, 
    required this.hintText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: const Text("Save", style: TextStyle(color: Colors.white)),
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: const Text("Cancel", style: TextStyle(color: Colors.white)),
          color: Colors.black,
        ),
      ],
    );
  }
}