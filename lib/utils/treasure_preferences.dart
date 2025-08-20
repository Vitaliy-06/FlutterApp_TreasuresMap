import 'package:shared_preferences/shared_preferences.dart';

class TreasurePreferences {
  static late SharedPreferences _preferences;

  static Future init() async => _preferences = await SharedPreferences.getInstance();

  static Future setDiscovered(int id, bool isDiscovered) async => _preferences.setBool("data_treasure_$id", isDiscovered);

  static Future<bool?> getDiscovered(int id) async => _preferences.getBool("data_treasure_$id");

}