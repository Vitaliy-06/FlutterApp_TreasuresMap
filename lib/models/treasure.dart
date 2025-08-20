import 'package:app_treasure_hunt/models/coordinate.dart';

class Treasure {

  final int id;

  final String name;
  final Coordinate textLocation;
  final String description;
  bool isDiscovered;

  Treasure(this.id, this.name, this.textLocation, this.description, this.isDiscovered);

}