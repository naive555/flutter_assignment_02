import 'package:flutter/material.dart';
import 'package:flutter_assignment_02/TodoStorage/DBTodo.dart';

class NewTodoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewTodoListState();
  }
}

class NewTodoListState extends State<NewTodoListScreen>{
  final _formkey = GlobalKey<FormState>();
  final textController = TextEditingController();
  TodoProvider db = TodoProvider();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(15),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
              controller: textController,
              validator: (value){
                if(value.isEmpty){
                  return 'Please fill subject';
                }
              }
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () async {
                _formkey.currentState.validate();
                if (textController.text.length > 0) {             
                  await db.open("todo.db");
                  Todo todo = Todo();
                  todo.title = textController.text;
                  todo.done = false;
                  await db.insert(todo);
                  print(todo);
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      )
    );
  }
}