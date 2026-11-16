import 'package:flutter/material.dart';

import 'about_screen.dart';
import 'list_screen.dart';
import 'shared.dart';

enum AppRoute { home, list, about }

class AppDrawer extends StatelessWidget {
  final AppRoute current;

  const AppDrawer({super.key, required this.current});

  void _navigate(BuildContext context, AppRoute target) {
    final navigator = Navigator.of(context);
    navigator.pop(); // close the drawer
    if (target == current) return;

    // Go back to Home first so the stack never grows too deep.
    navigator.popUntil((route) => route.isFirst);

    if (target == AppRoute.list) {
      navigator.push(
        MaterialPageRoute(builder: (context) => const ListScreen()),
      );
    } else if (target == AppRoute.about) {
      navigator.push(
        MaterialPageRoute(builder: (context) => const AboutScreen()),
      );
    }
  }

  Widget _item(
      BuildContext context, {
        required IconData icon,
        required String label,
        required AppRoute route,
      }) {
    final selected = current == route;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          label,
          style: TextStyle(
            fontWeight: selected ? FontWeight.bold : FontWeight.w500,
          ),
        ),
        selected: selected,
        selectedColor: kPrimary,
        selectedTileColor: kPrimary.withValues(alpha: 0.10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onTap: () => _navigate(context, route),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
              20,
              MediaQuery.of(context).padding.top + 24,
              20,
              24,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [kPrimary, kDark],
              ),
            ),
            child: Stack(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.explore, size: 38, color: kPrimary),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Explore Pakistan',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Your travel guide',
                      style: TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
                // ✕ Close button
                Positioned(
                  top: -8,
                  right: -8,
                  child: IconButton(
                    tooltip: 'Close menu',
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 26,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          _item(context,
              icon: Icons.home_rounded, label: 'Home', route: AppRoute.home),
          _item(context,
              icon: Icons.list_alt_rounded,
              label: 'Destinations',
              route: AppRoute.list),
          _item(context,
              icon: Icons.info_outline_rounded,
              label: 'About',
              route: AppRoute.about),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.black45, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

// Back arrow (Navigator.pop) + menu icon (opens drawer) for pushed screens.
class DrawerBackLeading extends StatelessWidget {
  const DrawerBackLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const BackButton(),
        IconButton(
          tooltip: 'Menu',
          icon: const Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ],
    );
  }
}