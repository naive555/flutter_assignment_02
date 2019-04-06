import 'package:flutter/material.dart';

class NewTodoListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NewTodoListState();
  }
}

class NewTodoListState extends State<NewTodoListScreen>{
  final _formkey = GlobalKey<FormState>();
  final textController = TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Subject"),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Subject',
              ),
              controller: textController,
              validator: (value){
                if(value.isEmpty){
                  return 'Please fill subject';
                } else{
                  Navigator.pop(context);
                }
              }
            ),
            RaisedButton(
              child: Text('Save'),
              onPressed: () {
                _formkey.currentState.validate();
              },
            ),
          ],
        ),
      )
    );
  }
}