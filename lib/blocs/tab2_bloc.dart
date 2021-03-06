import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:state_management_demo/isolate_tasks/get_todo_task.dart';
import 'package:state_management_demo/isolate_tasks/worker/worker.dart';
import 'package:state_management_demo/models/todo_model.dart';

class Tab2Bloc extends ChangeNotifier {
  TodoModel todoModel;
  bool loading = false;
  int count = 0;

  Future getTodoData() async {
    final dio = Dio();
    var todoTask = GetTodoTask(dio: dio, id: 1);
    final worker = Worker(poolSize: 2);
    loading = true;
    notifyListeners();
    todoModel = (await worker.handle(todoTask)) as TodoModel;
    loading = false;
    notifyListeners();
  }

  void increaseCount() {
    count += 1;
    notifyListeners();
  }
}
