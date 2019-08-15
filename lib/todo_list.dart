import 'package:flutter/material.dart';

import 'package:flutter_todo/i10n/localization.dart';

class TodoListPage extends StatefulWidget {
  TodoListPage({Key key}) : super(key: key);

  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _taskNameController = TextEditingController();
  var _tasks = [];

  void _taskAdd() {
    setState(() {
      _tasks.add(_taskNameController.text);
      _taskNameController.text = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: AppLocalizations.of(context).taskName,
            ),
            controller: _taskNameController,
            onEditingComplete: _taskAdd,
          ),
          Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      child: Center(child: Text('${AppLocalizations.of(context).taskName}: ${_tasks[index]}')),
                    );
                  }
              )
          )
        ],
      ),
    );
  }
}
