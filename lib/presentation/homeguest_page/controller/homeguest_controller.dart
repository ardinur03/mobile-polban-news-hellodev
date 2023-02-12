import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/presentation/homeguest_page/models/homeguest_model.dart';
import 'package:flutter/material.dart';

class HomeguestController extends GetxController {
  HomeguestController(this.homeguestModelObj);

  TextEditingController group1337Controller = TextEditingController();

  Rx<HomeguestModel> homeguestModelObj;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    group1337Controller.dispose();
  }
}
