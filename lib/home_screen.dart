import 'package:app/task_controller.dart';
import 'package:app/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TaskController _taskController = Get.put(TaskController());
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return ListView.builder(
          itemCount: _taskController.tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(16),
              width: MediaQuery.sizeOf(context).width,
              height: 50,
              decoration: BoxDecoration(border: Border.all()),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    checkColor: Colors.white,
                    activeColor: Colors.green,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                  ),
                  isChecked
                      ? Text(
                          '${_taskController.tasks[index]}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.green,
                          ),
                        )
                      : Text(
                          '${_taskController.tasks[index]}',
                          style: TextStyle(fontSize: 18),
                        ),
                ],
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TaskScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
