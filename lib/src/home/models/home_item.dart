import 'package:flutter/widgets.dart';

class HomeItem {
  const HomeItem({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final String image;
  final String title;
  final String subtitle;
  final Color color;
}
