import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/NewTodoListScreen.dart';

class TodoScreen extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<TodoScreen> {
  int _index = 0;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Todo'),
       actions: <Widget>[
          new IconButton(icon: new Icon(Icons.add),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => NewTodoListScreen()));
              },
            ),
         ],
     ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: _index, // this will be set when a new tab is tapped
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
       onTap: (int index) {
          setState(() {
            _index = index;
          });
        },
     ),
   );
 }
}