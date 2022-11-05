import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/controller.dart';


class TodoEdit extends StatelessWidget {
  final int? index;
  TodoEdit({Key? key, @required this.index}) : super(key: key);
  final TodoController todoController = Get.find<TodoController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
    TextEditingController(text: todoController.todos[index!].task);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 50,left: 10,right: 10),
          child: Column(
            children: [
              TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,

                controller: textEditingController,

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // ignore: deprecated_member_use
                  ElevatedButton(
                    child: const Text('Cancel'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  // ignore: deprecated_member_use
                  ElevatedButton(
                    child: const Text('Update'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(color: Colors.white)),
                    onPressed: () {
                      var editing = todoController.todos[index!];
                      editing.task = textEditingController.text;
                      todoController.todos[index!] = editing;
                      Get.back();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
