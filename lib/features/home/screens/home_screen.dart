import 'package:cocoquest/core/game_progress.dart';
import 'package:cocoquest/features/achievements/screens/achievement_screen.dart';
import 'package:cocoquest/features/play/screens/play_screen.dart';
import 'package:cocoquest/features/explore/screens/explore_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/home_action_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF6),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [
              // Stars
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AchievementScreen(),
                          ),
                        );

                        setState(() {});
                      },
                      child: Image.asset(
                        'assets/images/rewards.png',
                        width: 60,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        "⭐ ${GameProgress.stars}",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                "Let's Play!",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),

              Image.asset(
                'assets/mascot/coco_happy.png',
                width: screenWidth * 0.7,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  HomeActionCard(
                    name: "balloon",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const PlayScreen()),
                      );
                      setState(() {});
                    },
                  ),

                  HomeActionCard(
                    name: "camera",
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ExploreScreen(),
                        ),
                      );

                      setState(() {});
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
