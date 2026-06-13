import 'package:cocoquest/features/play/screens/play_screen.dart';
import 'package:flutter/material.dart';

import '../../../widgets/home_action_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                    Image.asset('assets/images/rewards.png', width: 60),
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
                        "⭐ 0",
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
                    },
                  ),

                  HomeActionCard(name: "camera", onTap: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
