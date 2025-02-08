import 'package:admin/app/screens/project/controller/project_controller.dart';
import 'package:admin/app/screens/task/controller/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await projectController.getProjects();
      await taskController.getTasks();
      total_projects.value = projectController.projectList.length;
      total_tasks.value = taskController.tasksList.length; 
    });
    super.onInit();
  }

  final projectController = Get.put(ProjectController());
  final taskController = Get.put(TaskController());
  final total_projects = 0.obs;
  final total_tasks = 0.obs;
  // final reminderController = Get.put(Remind());
}
