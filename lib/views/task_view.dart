import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tick_2do_getx/models/tasks.dart';



import '../controllers/controller.dart';

class TodoScreen extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.find<TodoController>();

  final TextEditingController textEditingController = TextEditingController();

  TodoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child:  Text('Cancel'),
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
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        textStyle: const TextStyle(color: Colors.white)),

                    onPressed: () {
                      todoController.todos.add(
                        Task(
                          task: textEditingController.text,
                        ),
                      );
                      Get.back();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
