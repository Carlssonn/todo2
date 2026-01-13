import 'package:card_page/model/todo_model.dart';
import 'package:card_page/ui/page/add_todo_page.dart';
import 'package:card_page/ui/widget/todo_card.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<TodoModel> todos = [
    TodoModel(
      desc:
          'Description of the note this can be any contentote this can be any content',
      title: 'Title',
    ),
    TodoModel(
      desc: 'Description of the note this can be any content',
      title: 'Title',
    ),
    TodoModel(
      desc: 'Description of the note this can be any content',
      title: 'Title',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Expanded(
            child: todos.isNotEmpty
                ? ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: todos.length,
                    itemBuilder: (context, index) {
                      return TodoCard(
                        todoModel: todos[index],
                        delete: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        edit: () {},
                      );
                    },
                  )
                : Center(child: Text('Nothing found :(')),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoPage()),
          );
        },
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color.fromARGB(255, 227, 230, 255),
          ),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
