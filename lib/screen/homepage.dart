import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hivemictodo/data/model.dart';
import 'package:hivemictodo/screen/dialogbox.dart';
import 'package:hivemictodo/screen/mybutton.dart';
import 'package:hivemictodo/screen/todotail.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the  box
  final _mybox = Hive.box('mybox');
  @override
  void initState() {
    //if this is the first time opening the app then create default data
    if (_mybox.get('Todolist') == null) {
      db.createInitialData();
    } else {
      //there alrady exist data
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  TodDoDataBase db = TodDoDataBase();
  //text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkboxchanged(bool? value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.updataDatabase();
  }

  //save the task
  void saveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updataDatabase();
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          // return
          return AlertDialog(
            backgroundColor: Colors.yellow,
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Add a New task',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //save
                        Mybuttons(
                            text: 'save',
                            onpressed: () {
                              saveNewTask();
                            }),

                        SizedBox(
                          height: 10,
                        ),
                        //cancel
                        Mybuttons(
                            text: 'cancel',
                            onpressed: () {
                              Navigator.of(context).pop();
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );

          //     DialogWidget(
          //   controller: _controller,
          //   onSaves: saveNewTask,
          //   oncancel: () => Navigator.of(context).pop(),
          // );

          // });
        });
  }

  void deletetask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.updataDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[30],
          onPressed: () {
            createnewtask();
          },
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.yellow[300],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: const Text('To Do'),
          elevation: 0,
        ),
        body: ListView.builder(
            itemCount: db.toDolist.length,
            itemBuilder: (context, index) {
              return ToDoTile(
                deletefunction: (context) => deletetask(index),
                taskName: db.toDolist[index][0],
                taskvalue: db.toDolist[index][1],
                onChanged: (value) {
                  checkboxchanged(value, index);
                },
              );
            }));
  }
}
