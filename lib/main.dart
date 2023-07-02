import 'package:flutter/material.dart';

void main() => runApp(const ReorderableApp());

class ReorderableApp extends StatelessWidget {
  const ReorderableApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Net Thing To Do')),
        body: const ReorderableExample(),
      ),
    );
  }
}

class ReorderableExample extends StatefulWidget {
  const ReorderableExample({Key? key}) : super(key: key);

  @override
  State<ReorderableExample> createState() => _ReorderableExampleState();
}

class _ReorderableExampleState extends State<ReorderableExample> {
  final List<int> _items = List<int>.generate(50, (int index) => index);

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final Color oddItemColor = colorScheme.primary.withOpacity(0.05);
    final Color evenItemColor = colorScheme.primary.withOpacity(0.15);

    return ReorderableListView(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      children: <Widget>[
        for (int index = 0; index < _items.length; index++)
          ListTile(
              key: Key('$index'),
              tileColor: _items[index].isOdd ? oddItemColor : evenItemColor,
              title: Text('Item ${_items[index]}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return TaskEntryWidget();
                  },
                );
              }),
      ],
      onReorder: (int oldIndex, int newIndex) {
        setState(() {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final int item = _items.removeAt(oldIndex);
          _items.insert(newIndex, item);
        });
      },
    );
  }
}

class TaskEntryWidget extends StatefulWidget {
  @override
  _TaskEntryWidgetState createState() => _TaskEntryWidgetState();
}

class _TaskEntryWidgetState extends State<TaskEntryWidget> {
  TextEditingController _taskNameController = TextEditingController();
  String _taskName = '';

  @override
  void dispose() {
    _taskNameController.dispose();
    super.dispose();
  }

  void _saveTask() {
    setState(() {
      _taskName = _taskNameController.text;
    });
    // Perform additional actions with the task name, such as storing it in a database
    // or passing it to another widget.
    print('Task Name: $_taskName');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          TextField(
            controller: _taskNameController,
            decoration: InputDecoration(
              labelText: 'Task Name',
            ),
          ),
          ElevatedButton(
            onPressed: _saveTask,
            child: Text('Save'),
          ),
        ],
      ),
    );
  }
}
