import 'package:app_treasure_hunt/screens/home.dart';
import 'package:app_treasure_hunt/utils/treasure_preferences.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Init saved_preferences
  await TreasurePreferences.init();

  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.white),
      home: Home(),
    );
  }
}
