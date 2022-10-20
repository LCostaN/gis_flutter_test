import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/home_item.dart';
import '../../progress/progress_view.dart';

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({Key? key, required this.item}) : super(key: key);

  final HomeItem item;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Stack(
        children: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: item.title,
                      child: Image.asset(
                        item.image,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .apply(color: Colors.white),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            onTap: () => goToProgress(context),
          ),
          Positioned(
            top: 0,
            right: -5,
            child: PopupMenuButton<int>(
              icon: const Icon(Icons.more_vert, color: Colors.black87),
              initialValue: 0,
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Text(AppLocalizations.of(context)!.options),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToProgress(BuildContext context) {
    Navigator.of(context).pushNamed(ProgressView.routeName, arguments: item);
  }
}
