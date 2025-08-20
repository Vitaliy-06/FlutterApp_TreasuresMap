import 'package:app_treasure_hunt/components/treasure_checkbox.dart';
import 'package:app_treasure_hunt/models/treasure.dart';
import 'package:flutter/material.dart';

class ModalDialog extends StatelessWidget {
  final Treasure _treasure;

  const ModalDialog(this._treasure, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_on, color: Colors.brown),
          Text(
            _treasure.name,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ],
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Coordinate
          Container(
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'X: ${_treasure.textLocation.x.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                Text(
                  'Y: ${_treasure.textLocation.y.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
              ],
            ),
          ),

          // Description
          Container(
            margin: EdgeInsets.only(bottom: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Text(
              _treasure.description,
              style: TextStyle(fontSize: 16.0, color: Colors.white),
            ),
          ),

          // Is dicovered
          TreasureCheckbox(_treasure, key: ValueKey(_treasure.id)),
        ],
      ),
      actions: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            overlayColor: Colors.brown,
          ),
          icon: Icon(Icons.arrow_back_sharp, color: Colors.brown),
          label: Text('Return', style: TextStyle(color: Colors.brown)),
          onPressed: () {
            Navigator.of(context).pop(_treasure);
          },
        ),
      ],
    );
  }
}
