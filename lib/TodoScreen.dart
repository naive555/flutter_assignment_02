import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<TodoScreen> {

 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Todo'),
       actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add),
              onPressed: (){},
            ),
         ],
     ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: 1, // this will be set when a new tab is tapped
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.list),
           title: new Text('Task'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.done_all),
           title: new Text('Complete'),
         ),
       ],
     ),
   );
 }
}