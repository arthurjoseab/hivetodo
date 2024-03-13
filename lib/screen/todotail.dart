import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskvalue,
    required this.onChanged,
    required this.deletefunction,
  });
  final String taskName;
  final bool taskvalue;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            borderRadius: BorderRadius.circular(20),
            onPressed: deletefunction,
            icon: Icons.delete,
            backgroundColor: Colors.red,
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.yellow),
          child: ListTile(
              leading: Checkbox(
                activeColor: Colors.green,
                onChanged: onChanged,
                value: taskvalue,
              ),
              title: Text(
                taskName,
                style: TextStyle(
                    decoration: taskvalue
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )),
        ),
      ),
    );
  }
}
