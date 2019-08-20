import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:state_management_demo/isolate_tasks/get_todo_task.dart';
import 'package:state_management_demo/isolate_tasks/worker/worker.dart';
import 'package:state_management_demo/models/todo_model.dart';

class Tab1Bloc extends ChangeNotifier {
  var todoModel;
  bool loading = false;

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
}
