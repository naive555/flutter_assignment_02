import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/TodoStorage/DBTodo.dart';

class TodoScreen extends StatefulWidget {
 @override
 State<StatefulWidget> createState() {
    return _TodoState();
  }
}

class _TodoState extends State<TodoScreen> {
  TodoProvider provider = TodoProvider();
  int tabIndex = 0;
 @override
 Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
          icon: Icon(
            tabIndex == 0 ? Icons.add : Icons.delete,
          ),
          onPressed: () async {
            if(tabIndex == 0){
              Navigator.pushNamed(context, '/newTodoList');
            } else{
              await provider.deleteAllDone();
            }
            setState(() {});
            },
          ),
        ]
      ),
      body: FutureBuilder<List<Todo>>(
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
            return Center(
              child: Text('No data found..'),
            );
        },
      ),
     bottomNavigationBar: BottomNavigationBar(
       currentIndex: tabIndex,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.list),
           title: new Text('Task'),
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.done_all),
           title: new Text('Completed'),
         ),
       ],
       onTap: (int i) {
          setState(() {
            tabIndex = i;
          });
        },
     ),
   );
 }
}