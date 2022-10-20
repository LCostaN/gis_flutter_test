import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gis_flutter_test/src/home/models/home_navigation_item.dart';

import '../home/models/home_item.dart';

class ProgressController with ChangeNotifier {
  ProgressController({
    required this.item,
    required this.selectedIndex,
    required this.navItems,
  });

  final HomeItem item;
  final int selectedIndex;
  final List<HomeNavigationItem> navItems;

  double _progress = Random().nextDouble();
  double get progress => _progress;

  void updateProgress(double? value) {
    if((value ?? _progress) == _progress) return;
    
    _progress = value!;
    
    notifyListeners();
  }
}
