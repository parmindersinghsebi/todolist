import 'package:flutter/material.dart';
import 'package:todo_list/taskcreater.dart';
import 'package:todo_list/todotile.dart';
import 'package:hive/hive.dart';
import 'database.dart';

class Taskscreen extends StatefulWidget {
  const Taskscreen({Key? key}) : super(key: key);

  @override
  State<Taskscreen> createState() => _TaskscreenState();
}

class _TaskscreenState extends State<Taskscreen> {
  final _mybox = Hive.box('mybox');

  @override
  void initState() {
    if (_mybox.get('Todolist') == null) {
      db.createInitialdata();
    } else {
      db.loaddata();
    }
    super.initState();
  }

  Database db = Database();

  final _controller = TextEditingController();
  void checkboxchange(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updatedatabase();
  }

  void savingtask() {
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updatedatabase();
  }

  void cancelingtask() {
    Navigator.of(context).pop();
  }

  void createtask() {
    showDialog(
      context: context,
      builder: (context) {
        return Taskcreater(
          controller: _controller,
          saving: savingtask,
          canceling: cancelingtask,
        );
      },
    );
  }

  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TodoList'),
        backgroundColor: Colors.teal,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 35,
                ),
                radius: 30,
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Todo List',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
              ),
              Text(
                'Make Your Task List',
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return Todotile(
              text: db.todolist[index][0],
              checkboxvalue: db.todolist[index][1],
              changing: (value) => checkboxchange(value, index),
              deletetask: (BuildContext) => deletetask(index),
            );
          },
        )),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createtask();
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
      ),
    );
  }
}
