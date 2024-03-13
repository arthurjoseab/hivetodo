import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivemictodo/screen/homepage.dart';

void main() async {
  //   //initalize hive
  await Hive.initFlutter();

  ///open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}



// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   //reference our box
//   final _myBox = Hive.box('mybox');
//   //write data
//   void writeData() {
//     _myBox.put(1, 'this is me');
//     //print(_myBox.get(1));
//   }

//   //read data
//   void readData() {
//     print(_myBox.get(1));
//   }

//   //delete data
//   void deleteData() {
//     _myBox.delete(1);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             MaterialButton(
//               color: Colors.blue,
//               onPressed: () {
//                 writeData();
//               },
//               child: Text(
//                 'Write',
//               ),
//             ),
//             MaterialButton(
//                 color: Colors.green,
//                 onPressed: () {
//                   readData();
//                 },
//                 child: Text('read')),
//             MaterialButton(
//                 color: Colors.purple,
//                 onPressed: () {
//                   deleteData();
//                 },
//                 child: Text('delete'))
//           ],
//         ),
//       ),
//     );
//   }
// }
