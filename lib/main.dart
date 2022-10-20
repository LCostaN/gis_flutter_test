import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'src/home/home_controller.dart';
import 'src/home/home_service.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  final settingsController = SettingsController(SettingsService());
  final homeController = HomeController(HomeService());

  await settingsController.loadSettings();
  await homeController.initialize();

  runApp(MyApp(
    settingsController: settingsController,
    homeController: homeController,
  ));
}
