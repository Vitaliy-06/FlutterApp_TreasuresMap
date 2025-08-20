import 'package:flutter/material.dart';

class DefaultAppBar extends AppBar {
  final BuildContext context;

  DefaultAppBar(this.context, {super.key});

  @override
  final Widget title = Text(
    "TREASURES MAP",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
  );

  @override
  final IconThemeData iconTheme = IconThemeData(color: Colors.brown);

  @override
  final Color backgroundColor = Colors.brown;

  @override
  final bool centerTitle = false;

  bool _isActive = false;

  @override
  late final List<Widget> actions = [
    IconButton(
      icon: const Icon(Icons.help, color: Colors.white),
      tooltip: 'Help',
      onPressed: () async {
        if(_isActive) return;

        _isActive = true;

        await ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 3),
            backgroundColor: Colors.brown,
            content: Text(
              "Explore the treasures on map! You can tap a treasure to see details.",
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),
        ).closed;

        _isActive = false;
      },
    ),
  ];
}
