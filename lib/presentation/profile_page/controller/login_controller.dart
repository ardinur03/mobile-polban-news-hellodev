import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/apiClient/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:polban_news/presentation/profile_page/profile_page_screen.dart';
import 'package:polban_news/presentation/profile_page/widget/sign_in_page.dart';
import 'package:polban_news/presentation/profile_page/model/profile_model.dart';

class TokenController {
  RxList<User> userList = RxList<User>();

  Future<void> fecthUser() async {
    try {
      userList.value = await ApiClient().getUser();
    } catch (e) {
      Get.snackbar('Error', 'Gagal mendapatkan data slider : $e');
    }
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    print(prefs.getString('token'));
    print(ApiClient().getToken());
    ApiClient().clearBearerToken();
    print(ApiClient().getToken());
  }

  //Set User from shred_pref user
  Future<User> setUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    User user = json.decode(prefs.getString('user')!);

    return user;
  }
}
