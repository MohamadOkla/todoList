import 'package:get/get.dart';

class TaskController extends GetxController {
  var tasks = [].obs;
  void addTask(String task) {
    tasks.add(task);
  }
}
