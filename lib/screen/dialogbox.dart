import 'package:flutter/material.dart';
import 'package:hivemictodo/screen/mybutton.dart';

class DialogWidget extends StatelessWidget {
  final controller;
  VoidCallback onSaves;
  VoidCallback oncancel;
  DialogWidget({
    super.key,
    required this.controller,
    required this.onSaves,
    required this.oncancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.yellow,
        content: Container(
          height: 120,
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Add a New task',
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //save
                  Mybuttons(
                      text: 'save',
                      onpressed: () {
                        onSaves;
                      }),

                  SizedBox(
                    height: 10,
                  ),
                  //cancel
                  Mybuttons(
                      text: 'cancel',
                      onpressed: () {
                        oncancel;
                      }),
                ],
              )
            ],
          ),
        ));
  }
}
