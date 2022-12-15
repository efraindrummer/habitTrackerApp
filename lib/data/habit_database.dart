import 'package:hive_flutter/hive_flutter.dart';
import 'package:trackerhabits/datetime/date_time.dart';


final _myBox = Hive.box("Habit_Database");

class HabitDatabase {

  List todaysHabitList = [];

  //crar data inicial default
  void createDefaultData(){
    todaysHabitList = [
      ["Run", false],
      ["Read", false]
    ];

    _myBox.put("START_DATE", todaysDateFormatted());
  }
  //cargar data si existe
  void loadData(){
    if(_myBox.get(todaysDateFormatted()) == null){
      todaysHabitList = _myBox.get("CURRENT_HABIT_LIST");
      
      for (int i = 0; i < todaysHabitList.length; i++) {
        todaysHabitList[i][1] = false;
      }
    }else{
      //set all habit
      todaysHabitList = _myBox.get(todaysDateFormatted());
    }
  }
  //actualizar data
  void updateDatabase(){
    //update todays entry
    _myBox.put(todaysDateFormatted(), todaysHabitList);
    //update universal habit
    _myBox.put("CURRENT_HABIT_LIST", todaysHabitList);
  }
}