import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'progress_controller.dart';
import 'widgets/progress_item_widget.dart';
import 'widgets/progress_week_widget.dart';

import '../home/home_view.dart';
import '../widgets/circular_progress_indicator_rounded.dart';
import '../widgets/dot_divider.dart';

class ProgressView extends StatelessWidget {
  const ProgressView({
    super.key,
    required this.controller,
  });

  static const routeName = '/progress';

  static const _kProgressSize = 180.0;
  static const _kImageSize = 125.0;

  final ProgressController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.progress),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(Icons.more_horiz),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 1,
                child: Text(AppLocalizations.of(context)!.options),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: SizedBox(
                width: _kProgressSize,
                height: _kProgressSize,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: AnimatedBuilder(
                        animation: controller,
                        builder: (context, _) => CircularProgressIndicatorRounded(
                          strokeWidth: 12,
                          value: controller.progress,
                        ),
                      ),
                    ),
                    Center(
                      child: Hero(
                        tag: controller.item.title,
                        child: Image.asset(
                          controller.item.image,
                          color: Theme.of(context).iconTheme.color,
                          height: _kImageSize,
                          width: _kImageSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 48),
            Row(
              children: [
                const ProgressItemWidget(title: "23", subtitle: 'LOREM'),
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, _) => ProgressItemWidget(
                    title: formatProgress(controller.progress),
                    subtitle: 'DOLOR SIT',
                  ),
                ),
                const ProgressItemWidget(title: "234", subtitle: 'AMET'),
              ],
            ),
            const SizedBox(height: 18),
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) => Slider(
                value: controller.progress,
                onChanged: (value) => controller.updateProgress(value),
              ),
            ),
            const SizedBox(height: 18),
            const DotDivider(),
            const SizedBox(height: 18),
            const Expanded(child: ProgressWeekWidget()),
          ],
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
              currentIndex: controller.selectedIndex,
              backgroundColor: Colors.transparent,
              onTap: (value) {
              if (controller.selectedIndex == value) return;

              Navigator.of(context).pushNamedAndRemoveUntil(
                HomeView.routeName,
                (route) => route.isFirst,
                arguments: value,
              );
            },
              items: controller.navItems
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: Icon(e.icon),
                      label: e.label,
                      backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
    );
  }

  String formatProgress(double value) {
    var progress = (value * 100).clamp(0, 100).toStringAsFixed(1);
    return "$progress%";
  }
}
