import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:trackerhabits/components/habit_tile.dart';
import 'package:trackerhabits/components/my_fab.dart';
import 'package:trackerhabits/components/my_alert_box.dart';
import 'package:trackerhabits/data/habit_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  bool habitCompleted = false;

  @override
  void initState() {
    
    if(_myBox.get("CURRENT_HABIT_LIST") == null){
      db.createDefaultData();
    }else{
      db.loadData();
    }

    db.updateDatabase();

    super.initState();
  }

  void checkboxTapped(bool? value, int index){
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
  }

  final _newHabitNameController = TextEditingController();

  void createNewHabit(){
    showDialog(
      context: context,
      builder: (context){
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: "Enter Habit Name",
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      }
    );
  }

  void saveNewHabit(){
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void cancelDialogBox(){
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

  void openHabitSettings(int index){
    showDialog(
      context: context, 
      builder: (context){
        return MyAlertBox(
          controller: _newHabitNameController,
          hintText: db.todaysHabitList[index][0],
          onSave: () =>saveExistingHabit(index), 
          onCancel: cancelDialogBox,
        );
      }
    );
  }

  void saveExistingHabit(int index){
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    _newHabitNameController.clear();
    Navigator.of(context);
  }

  void deleteHabit(int index){
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: MyFloatingActionButton(
        onPressed: () => createNewHabit(),
      ),
      backgroundColor: Colors.grey[300],
      body: ListView.builder(
        itemCount: db.todaysHabitList.length,
        itemBuilder: (context, index){
          return HabitTile(
            habitName: db.todaysHabitList[index][0], 
            habitCompleted: db.todaysHabitList[index][1], 
            onChanged: (value) => checkboxTapped(value, index),
            settingsTapped: (context) => openHabitSettings(index),
            deleteTapped: (context) => deleteHabit(index),
          );
        },
      )
    );
  }
}