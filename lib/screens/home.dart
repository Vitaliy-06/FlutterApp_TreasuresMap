import 'package:app_treasure_hunt/components/default_app_bar.dart';
import 'package:app_treasure_hunt/components/map.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(context),
      body: MapTreasure(),
    );
  }
}
