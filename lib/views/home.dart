import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tick_2do_getx/views/task_view.dart';
import '../controllers/controller.dart';
import '../main.dart';
import 'edit_task_view.dart';

class HomeScreen extends StatelessWidget {
  static const id = '/Home_screen';
  final TodoController todoController = Get.put(TodoController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed(TodoScreen.id);
        },
      ),
      body: Obx(
            () => ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.deepOrange,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
              Get.snackbar('Remove!', "Task was successfully Delete",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: ListTile(
              title: Text(
                todoController.todos[index].task!,
                style: todoController.todos[index].done
                    ? const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                )
                    : const TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                onPressed: () => Get.to(() => TodoEdit(index: index)),
                icon: const Icon(Icons.edit),
              ),
              leading: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (neWvalue) {
                  var todo = todoController.todos[index];
                  todo.done = neWvalue!;
                  todoController.todos[index] = todo;
                },
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}
