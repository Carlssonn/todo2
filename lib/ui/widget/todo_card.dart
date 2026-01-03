import 'package:card_page/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  const TodoCard({super.key, required this.todoModel});
  final TodoModel todoModel;

  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 100,
      height: 95,
      margin: EdgeInsets.fromLTRB(12, 4, 12, 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xFF5566FF),
      ),
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
              Checkbox(
                value: widget.todoModel.dene,
                onChanged: (_) {
                  setState(() {
                    widget.todoModel.dene = !widget.todoModel.dene;
                  });
                },
              ),

              IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.edit),
                color: Colors.white,
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
    );
  }
}
