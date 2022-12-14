import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {

  final String habitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabitTile({
    Key? key, 
    required this.habitName, 
    required this.habitCompleted, 
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context){},
              backgroundColor: Colors.grey.shade800,
              icon: Icons.settings,
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12.0)  
          ),
          child: Row(
            children: <Widget>[
              //checkbox
              Checkbox(
                value: habitCompleted, 
                onChanged: onChanged
              ),
              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}