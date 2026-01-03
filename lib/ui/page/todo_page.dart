import 'package:card_page/model/todo_model.dart';
import 'package:card_page/ui/widget/todo_bottom_shet.dart';
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
      dene: false,
      desc: 'Сегодня хочу рано встать, меня ждут вуликие дела',
      title: 'По завтракать',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60),
          Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Поиск..',
                prefix: Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(vertical: 17),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoCard(todoModel: todos[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => TodoBottomShet(
              add: (todo) {
                setState(() {
                  todos.add(todo);
                });
              },
            ),
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
