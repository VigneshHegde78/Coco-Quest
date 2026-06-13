import '../../../core/game_progress.dart';

class AchievementHelper {
  static bool firstStar() {
    return GameProgress.stars >= 1;
  }

  static bool balloonMaster() {
    return GameProgress.balloonsPopped >= 10;
  }

  static bool explorer() {
    return GameProgress.objectsFound >= 1;
  }

  static bool treasureHunter() {
    return GameProgress.missionsCompleted >= 1;
  }

  static bool cocoChampion() {
    return GameProgress.stars >= 50;
  }
}
