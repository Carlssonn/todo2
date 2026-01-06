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
                onPressed: () {
                  showAdaptiveDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(child: Text('Внимание')),
                        content: Text('Вы действительно хотите удалить?'),
                        actionsAlignment: MainAxisAlignment.spaceEvenly,
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 122,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.red),
                              ),
                              child: Center(
                                child: Text(
                                  'Отмена',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF5566FF),
                              minimumSize: Size(120, 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              widget.delete();
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Удалить',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                icon: Icon(Icons.delete),
                color: Colors.white,
              ),

              IconButton(
                onPressed: widget.edit,
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
