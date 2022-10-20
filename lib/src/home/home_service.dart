import 'package:flutter/material.dart';

import '../../constants/image_assets.dart';
import 'models/home_item.dart';
import 'models/home_navigation_item.dart';

// Keeping it as Future<T> to simulate a database or API situation.
class HomeService {
  Future<List<HomeItem>> loadItems() async {
    return [
      const HomeItem(
        image: ImageConstants.clock,
        title: "Be Active",
        subtitle: "2 times a day",
        color: Colors.purple,
      ),
      HomeItem(
        image: ImageConstants.shoe,
        title: "Go for a walk",
        subtitle: "5 times a week",
        color: Colors.red.shade300,
      ),
      const HomeItem(
        image: ImageConstants.glasses,
        title: "Read at night",
        subtitle: "3 times a week",
        color: Colors.orange,
      ),
      const HomeItem(
        image: ImageConstants.dinner,
        title: "Cook dinner",
        subtitle: "1 time a day",
        color: Colors.lightBlue,
      ),
      HomeItem(
        image: ImageConstants.papers,
        title: "Organize Work",
        subtitle: "1 time a day",
        color: Colors.green.shade200,
      ),
      HomeItem(
        image: ImageConstants.book,
        title: "Practice French",
        subtitle: "2 times a week",
        color: Colors.teal.shade200,
      ),
    ];
  }

  Future<List<HomeNavigationItem>> loadNavItems() async {
    return [
      const HomeNavigationItem(icon: Icons.home, label: "Home"),
      const HomeNavigationItem(icon: Icons.radar, label: "Explore"),
      const HomeNavigationItem(icon: Icons.star, label: "Goals"),
      const HomeNavigationItem(icon: Icons.person, label: "Profile"),
    ];
  }
}
