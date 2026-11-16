import 'package:flutter/material.dart';

// Keeps every page at max 520 px wide, with a white surround.
class PageFrame extends StatelessWidget {
  final Widget child;
  final Color? background;

  const PageFrame({super.key, required this.child, this.background});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background ?? Colors.white,
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: child,
        ),
      ),
    );
  }
}