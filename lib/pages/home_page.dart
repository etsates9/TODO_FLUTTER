
import 'package:flutter/material.dart';
import 'package:todo_flutter/util/dialog_box.dart';
import 'package:todo_flutter/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();

  List toDoList = [
    ["Advance study", false],
    ["Copy notes", false],
    ["Watch Fantasy series", false],
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00438A),
        title: Center(child: Text('To Do List')),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00438A),
        onPressed: createNewTask,
        child: Icon(Icons.add, color: const Color(0xFFDC1E35)),
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF00438A),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(60),
                          blurRadius: 2,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        'assets/image/logo.png',
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(
                          Icons.book,
                          color: const Color(0xFF00438A),
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Tasks: ${toDoList.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: toDoList.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.check_circle,
                          size: 70,
                          color: const Color(0xFF8DC2E8),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "No tasks remaining",
                          style: TextStyle(
                            fontSize: 18,
                            color: const Color(0xFF00438A),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: toDoList.length,
                    itemBuilder: (context, index) {
                      return ToDoTile(
                        taskName: toDoList[index][0],
                        taskCompleted: toDoList[index][1],
                        onChanged: (value) => checkBoxChanged(value, index),
                        deleteFunction: (context) => deleteTask(index),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}