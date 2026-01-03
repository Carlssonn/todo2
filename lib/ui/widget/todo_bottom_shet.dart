import 'package:card_page/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoBottomShet extends StatelessWidget {
  TodoBottomShet({super.key, required this.add});
  final Function(TodoModel) add;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(title: Text('Добавить задачу')),
        TextField(
          controller: titleController,
          decoration: InputDecoration(
            hintText: 'Название',
            contentPadding: EdgeInsets.symmetric(vertical: 15),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          maxLines: 5,
          controller: descController,
          decoration: InputDecoration(
            hintText: '',
            contentPadding: EdgeInsets.symmetric(vertical: 17),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ),
        SizedBox(height: 30),
        InkWell(
          onTap: () {
            add(
              TodoModel(
                title: titleController.text,
                desc: descController.text,
                dene: true,
              ),
            );
            Navigator.pop(context);
          },

          child: Container(
            width: 390,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Color(0xFf5566FF),
            ),
            child: Center(
              child: Text(
                'Добавить',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
