import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:tick_2do_getx/views/home.dart';
import 'package:tick_2do_getx/views/task_view.dart';


void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Tick2Do';

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: title,
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      getPages: [
        GetPage(name: TodoScreen.id, page: () => TodoScreen()),
        GetPage(name: HomeScreen.id, page: () => HomeScreen()),
      ],
    );
  }
}
