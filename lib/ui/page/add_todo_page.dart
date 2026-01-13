import 'dart:io';

import 'package:card_page/model/todo_model.dart';
import 'package:card_page/ui/widget/text_field.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key, this.todoModel});

  final TodoModel? todoModel;

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  String? image;
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      ImagePicker().pickImage(source: ImageSource.gallery);
                    },
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Color(0xffFFE5BE),
                      child: image != null
                          ? Image.file(File(image!))
                          : Center(
                              child: Text(
                                'photo',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),
                  MTextField(
                    controller: TextEditingController(),
                    hint: 'title',
                  ),
                  SizedBox(height: 20),
                  MTextField(
                    controller: TextEditingController(),
                    hint: 'description',
                  ),
                  SizedBox(height: 20),
                  MTextField(controller: TextEditingController(), hint: 'date'),
                  SizedBox(height: 20),

                  InkWell(
                    onTap: () {
                      (
                        TodoModel(
                          title: titleController.text,
                          desc: descController.text,
                        ),
                      );
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0xffFFE5BE),
                      ),
                      child: Center(
                        child: Text(
                          'add',
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
