import 'package:app_treasure_hunt/components/modal_dialog.dart';
import 'package:app_treasure_hunt/models/treasure.dart';
import 'package:app_treasure_hunt/services/treasure_service.dart';
import 'package:flutter/material.dart';

class MapTreasure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double imageWidth = constraints.maxWidth;
          final double imageHeight = constraints.maxHeight;

          return FutureBuilder(
            future: _treasures(context, imageWidth, imageHeight),
            builder:
                (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
                  if (snapshot.hasData) {
                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.asset(
                          "assets/map.jpg",
                          fit: BoxFit.fill,
                          width: imageWidth,
                          height: imageHeight,
                        ),
                        ...?snapshot.data,
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
          );
        },
      ),
    );
  }

  Future<void> _showMyDialog(BuildContext context, Treasure treasure) async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) =>
          ModalDialog(treasure, key: ValueKey(treasure.id)),
    );
  }

  Future<List<Widget>> _treasures(
    BuildContext context,
    double imageWidth,
    double imageHeight,
  ) async {
    final treasures = await TreasureService.fetchAllTreasures();
    return treasures
        .map(
          (treasure) => Positioned(
            key: ValueKey(treasure.id),
            height: 50.0,
            bottom: treasure.textLocation.y * imageHeight,
            left: treasure.textLocation.x * imageWidth,
            child: GestureDetector(
              child: Image.asset("assets/treasure.png", width: 50, height: 50),
              onTap: () => _showMyDialog(context, treasure),
            ),
          ),
        )
        .toList();
  }
}
