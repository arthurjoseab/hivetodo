import 'package:hive/hive.dart';

class TodDoDataBase {
  List toDolist = [];
  final _myBox = Hive.box('mybox');
  //run this method if this is the 1st time opening this app
  void createInitialData() {
    toDolist = [
      ['made Tutorial', false],
      ['Do Execise', false]
    ];
  }

  //load the data from database
  void loadData() {
    toDolist = _myBox.get('Todolist');
  }

  //update the database
  void updataDatabase() {
    _myBox.put('Todolist', toDolist);
  }
}
