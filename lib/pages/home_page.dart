import 'package:flutter/material.dart';
import 'package:trackerhabits/components/habit_tile.dart';
import 'package:trackerhabits/components/my_fab.dart';
import 'package:trackerhabits/components/new_habit_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List todaysHabitList = [
    ["Morning Run", false],
    ["Read Book", false],
    ["Coding App", false],
  ];

  bool habitCompleted = false;

  void checkboxTapped(bool? value, int index){
    setState(() {
      todaysHabitList[index][1] = value;
    });
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit(){
    showDialog(
      context: context,
      builder: (context){
        return EnterNewHabitBox(
          controller: _newHabitNameController,
          onSave: saveNewHabit,
          onCancel: cancelNewHabit,
        );
      }
    );
  }

  void saveNewHabit(){
    setState(() {
      todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void cancelNewHabit(){
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloartingActionButton(
        onPressed: () => createNewHabit(),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: todaysHabitList.length,
        itemBuilder: (context, index){
          return HabitTile(
            habitName: todaysHabitList[index][0], 
            habitCompleted: todaysHabitList[index][1], 
            onChanged: (value) => checkboxTapped(value, index)
          );
        },
      )
    );
  }
}