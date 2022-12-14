import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {

  final controller; 
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const EnterNewHabitBox({
    Key? key, 
    this.controller, 
    required this.onSave, 
    required this.onCancel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey[900],
      content: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration:const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)
          ),
        ),
      ),
      actions: [
        MaterialButton(
          onPressed: onSave,
          child: Text("Save", style: TextStyle(color: Colors.white)),
          color: Colors.black,
        ),
        MaterialButton(
          onPressed: onCancel,
          child: Text("Cancel", style: TextStyle(color: Colors.white)),
          color: Colors.black,
        ),
      ],
    );
  }
}