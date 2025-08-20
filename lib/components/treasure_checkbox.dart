import 'package:app_treasure_hunt/models/treasure.dart';
import 'package:app_treasure_hunt/utils/treasure_preferences.dart';
import 'package:flutter/material.dart';

class TreasureCheckbox extends StatefulWidget {
  final Treasure treasure;

  const TreasureCheckbox(this.treasure, {super.key});

  @override
  State<TreasureCheckbox> createState() => _TreasureCheckboxState();
}

class _TreasureCheckboxState extends State<TreasureCheckbox> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: widget.treasure.isDiscovered,
      onChanged: (bool? value) {
        setState(() {
          widget.treasure.isDiscovered = value!;
          TreasurePreferences.setDiscovered(widget.treasure.id, widget.treasure.isDiscovered);
        });
      },
      title: Text(
        "Is discovered?",
        style: TextStyle(
          fontSize: 16.0,
          color: Colors.brown,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentPadding: EdgeInsets.all(0),
      activeColor: Colors.green,
    );
  }
}
