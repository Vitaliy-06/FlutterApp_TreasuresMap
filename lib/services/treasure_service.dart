import 'package:app_treasure_hunt/models/coordinate.dart';
import 'package:app_treasure_hunt/models/treasure.dart';
import 'package:app_treasure_hunt/utils/treasure_preferences.dart';

class TreasureService {
  static Future<List<Treasure>> fetchAllTreasures() async {
    return [
      Treasure(
        0,
        "Golden Oak",
        Coordinate(0.65, 0.60),
        "Hidden near a hospital",
        await TreasurePreferences.getDiscovered(0) ?? false,
      ),
      Treasure(
        1,
        "River Rock Gem",
        Coordinate(0.80, 0.35),
        "Under the big rock by the river",
        await TreasurePreferences.getDiscovered(1) ?? false,
      ),
      Treasure(
        2,
        "School Coin",
        Coordinate(0.20, 0.45),
        "Buried in the old school",
        await TreasurePreferences.getDiscovered(2) ?? false,
      ),
      Treasure(
        3,
        "Magic Train",
        Coordinate(0.69, 0.20),
        "Inside a magic train",
        await TreasurePreferences.getDiscovered(3) ?? false,
      ),
      Treasure(
        4,
        "Hilltop Crown",
        Coordinate(0.25, 0.93),
        "At the very top of the hill",
        await TreasurePreferences.getDiscovered(4) ?? false,
      ),
    ];
  }
}
