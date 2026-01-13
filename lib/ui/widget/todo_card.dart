import 'package:card_page/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({
    super.key,
    required this.todoModel,
    required this.edit,
    required this.delete,
  });
  final TodoModel todoModel;
  final Function() edit;
  final Function() delete;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(6, 3, 1, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.todoModel.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.density_small_sharp),
                      ),
                      IconButton(
                        onPressed: widget.edit,
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: widget.delete,
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                  Text(
                    widget.todoModel.desc,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
