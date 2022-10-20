import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'home_controller.dart';
import 'widgets/home_item_widget.dart';
import '../settings/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.controller,
  });

  static const routeName = '/home';

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(controller.title),
          actions: [
            PopupMenuButton<int>(
              icon: const Icon(Icons.more_horiz),
              onSelected: (int result) {
                switch (result) {
                  case 1:
                    Navigator.of(context)
                        .restorablePushNamed(SettingsView.routeName);
                    return;
                  default:
                    return;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(AppLocalizations.of(context)!.options),
                ),
              ],
            ),
          ],
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => GridView.builder(
            restorationId: 'homeListView',
            padding: const EdgeInsets.all(16),
            gridDelegate: constraints.constrainWidth() > 720
                ? const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  )
                : const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
            itemCount: controller.items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = controller.items[index];
        
              return HomeItemWidget(item: item);
            },
          ),
        ),
        bottomNavigationBar: Hero(
          tag: 'bottomnav',
          child: Container(
            clipBehavior: Clip.antiAlias,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.index,
              backgroundColor: Colors.transparent,
              onTap: (value) {
                if (controller.index == value) return;

                controller.updateSelectedIndex(value);
              },
              items: controller.navItems
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(e.icon),
                      label: e.label,
                      backgroundColor:
                          Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
