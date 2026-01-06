import 'package:card_page/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoBottomShet extends StatefulWidget {
  const TodoBottomShet({super.key, required this.add, this.todoModel});

  final Function(TodoModel) add;
  final TodoModel? todoModel;

  @override
  State<TodoBottomShet> createState() => _TodoBottomShetState();
}

class _TodoBottomShetState extends State<TodoBottomShet> {
  late TextEditingController titleController;
  late TextEditingController descController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(
      text: widget.todoModel?.title ?? '',
    );
    descController = TextEditingController(text: widget.todoModel?.desc ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20),
                Text(
                  widget.todoModel == null
                      ? 'Добавить задачу'
                      : 'Изменить задачу',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    hintText: 'Название',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: descController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Описание',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),

                SizedBox(height: 30),

                InkWell(
                  onTap: () {
                    widget.add(
                      TodoModel(
                        title: titleController.text,
                        desc: descController.text,
                        dene: widget.todoModel?.dene ?? false,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Color(0xFF5566FF),
                    ),
                    child: Center(
                      child: Text(
                        widget.todoModel == null ? 'Сохранить' : 'Изменить',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
