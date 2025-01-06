

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuAppController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  var selectedIndex = 0.obs;

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  void changeIndex(int index) {
    selectedIndex.value = index;
    Get.log('Index $selectedIndex');
    scaffoldKey.currentState!.closeDrawer();
  }
}