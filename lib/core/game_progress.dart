import 'package:shared_preferences/shared_preferences.dart';

class GameProgress {
  static int stars = 0;
  static int balloonsPopped = 0;
  static int objectsFound = 0;
  static int missionsCompleted = 0;

  static Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();

    stars = prefs.getInt('stars') ?? 0;
    balloonsPopped = prefs.getInt('balloonsPopped') ?? 0;
    objectsFound = prefs.getInt('objectsFound') ?? 0;
    missionsCompleted = prefs.getInt('missionsCompleted') ?? 0;
  }

  static Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('stars', stars);
    await prefs.setInt('balloonsPopped', balloonsPopped);
    await prefs.setInt('objectsFound', objectsFound);
    await prefs.setInt('missionsCompleted', missionsCompleted);
  }

  static Future<void> reset() async {
    stars = 0;
    balloonsPopped = 0;
    objectsFound = 0;
    missionsCompleted = 0;

    await save();
  }
}
