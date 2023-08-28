import 'package:flutter/material.dart';

void main() {
  runApp(UTASK());
}

class UTASK extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Color customColor = const Color.fromRGBO(122, 83, 161, 1);

    return MaterialApp(
      title: 'U-TASK',
      theme: ThemeData(
        primaryColor: customColor,
      ),
      home: const TaskScreen(),
    );
  }
}

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TaskScreen> {
  List<String> _todoItems = [];
  int itemCount = 0;

  void _addTodoItem(String task) {
    setState(() {
      _todoItems.add(task);
    });
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_todoItems[index]),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () => _removeTodoItem(index),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('U-TASK'),
      ),
      backgroundColor: Color.fromARGB(255, 230, 226, 234),
      body: Column(
        children: [
          SizedBox(height: 16),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Hari Ini',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timer,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Terjadwal',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16), // Spacing
          Container(
            width: MediaQuery.of(context).size.width * 0.83,
            height: 80,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.all_inbox,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Semua',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'Daftar Saya',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 16), // Spacing
          Container(
            width: MediaQuery.of(context).size.width * 0.83,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.list, // Ganti dengan ikon yang Anda inginkan
                    size: 36,
                    color: Colors.black,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'List Daftar',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: _buildTodoList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String task = await showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Tambah Daftar'),
                content: TextField(
                  autofocus: true,
                  onSubmitted: (value) {
                    Navigator.pop(context, value);
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context, '');
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );

          if (task.isNotEmpty) {
            _addTodoItem(task);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
