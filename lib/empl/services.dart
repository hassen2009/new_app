import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class themeservices{
  final _box =GetStorage();
  final _key ='isDarkMode';
  _savethemetobox(bool isDarkMode)=>_box.write(_key, isDarkMode);
  bool _loadThemeFormBox()=>_box.read(_key)??false;
  ThemeMode get theme => _loadThemeFormBox()?ThemeMode.dark:ThemeMode.light;
  void SwitchTheme() {
   Get.changeThemeMode(_loadThemeFormBox()?ThemeMode.light:ThemeMode.dark);
   _savethemetobox(!_loadThemeFormBox());
  }
}