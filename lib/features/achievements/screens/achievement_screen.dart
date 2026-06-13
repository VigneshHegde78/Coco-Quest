import 'package:flutter/material.dart';

import '../helpers/achievement_helper.dart';
import '../models/achievement.dart';

class AchievementScreen extends StatelessWidget {
  const AchievementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final achievements = [
      Achievement(
        emoji: "⭐",
        title: "First Star",
        description: "Earn your first star",
        unlocked: AchievementHelper.firstStar(),
      ),

      Achievement(
        emoji: "🎈",
        title: "Balloon Master",
        description: "Pop 10 balloons",
        unlocked: AchievementHelper.balloonMaster(),
      ),

      Achievement(
        emoji: "📷",
        title: "Explorer",
        description: "Find your first object",
        unlocked: AchievementHelper.explorer(),
      ),

      Achievement(
        emoji: "🗺️",
        title: "Treasure Hunter",
        description: "Complete one mission",
        unlocked: AchievementHelper.treasureHunter(),
      ),

      Achievement(
        emoji: "🏆",
        title: "Coco Champion",
        description: "Earn 50 stars",
        unlocked: AchievementHelper.cocoChampion(),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF6),

      appBar: AppBar(
        title: const Text("Achievements"),
        backgroundColor: Colors.transparent,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: achievements.length,
        itemBuilder: (_, index) {
          final achievement = achievements[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),

            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: achievement.unlocked ? Colors.white : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),

            child: Row(
              children: [
                Text(achievement.emoji, style: const TextStyle(fontSize: 40)),

                const SizedBox(width: 16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        achievement.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(achievement.description),
                    ],
                  ),
                ),

                Icon(
                  achievement.unlocked ? Icons.check_circle : Icons.lock,
                  color: achievement.unlocked ? Colors.green : Colors.grey,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
