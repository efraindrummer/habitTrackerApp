import 'package:flutter/material.dart';

class MyFloartingActionButton extends StatelessWidget {

  final Function()? onPressed;

  const MyFloartingActionButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}