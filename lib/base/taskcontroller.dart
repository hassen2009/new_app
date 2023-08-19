import 'package:get/get.dart';
import 'package:new_app/Db/dbhelper.dart';
import 'package:new_app/base/task.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }
  var taskList= <Task>[].obs;

 Future<int> addTask({Task? task}) async {
    return await DBHelper.insert(task);
  }
  void getTasks() async {
    List<Map<String, dynamic>> tasks =  await DBHelper.query();
    taskList.assignAll(tasks.map((data) =>  Task.formJson(data)).toList());
  }
  void delete(Task task){
   DBHelper.delete(task);
   getTasks();
  }
  void marktaskTd(int id) async {
   await DBHelper.update(id);
   getTasks();
  }

  void marktaskTP(int id) async {
    await DBHelper.updates(id);
    getTasks();
  }
}