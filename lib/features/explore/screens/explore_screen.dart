import 'package:cocoquest/core/game_progress.dart';
import 'package:flutter/material.dart';
import 'camera_screen.dart';
import '../models/mission_item.dart';
import '../services/gemini_service.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<MissionItem> missions = [
    MissionItem(name: 'Book', emoji: '📚', keywords: ['book', 'notebook']),
    MissionItem(name: "Spoon", emoji: "🥄", keywords: ['spoon']),
    MissionItem(name: "Chair", emoji: "🪑", keywords: ['chair']),
  ];

  int get completedCount => missions.where((item) => item.found).length;

  void showFoundDialog(String itemName) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text("🎉 Great Job!"),
          content: Text("$itemName Found!\n⭐ +5 Stars"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Yay!"),
            ),
          ],
        );
      },
    );
  }

  void processResult(String result) async {
    for (final item in missions) {
      if (item.found) continue;

      for (final keyword in item.keywords) {
        if (result.contains(keyword)) {
          setState(() {
            item.found = true;
          });

          GameProgress.stars += 5;
          GameProgress.objectsFound++;
          await GameProgress.save();

          showFoundDialog(item.name);

          if (missions.every((m) => m.found)) {
            Future.delayed(const Duration(milliseconds: 500), () async {
              GameProgress.missionsCompleted++;
              showMissionComplete();
              await GameProgress.save();
            });
          }

          return;
        }
      }
    }
  }

  void showMissionComplete() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: const Text("🏆 Mission Complete!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/rewards/star.png', width: 120),

              const SizedBox(height: 16),

              const Text(
                "Amazing!\nYou found everything!",
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Awesome!"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF6),

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Explore",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            Image.asset('assets/mascot/coco_thinking.png', width: 180),

            const SizedBox(height: 10),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Text(
                "Can you find these things?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 30),

            Text(
              "$completedCount / ${missions.length} Found",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: missions.length,
                itemBuilder: (_, index) {
                  final item = missions[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),

                    padding: const EdgeInsets.all(20),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Row(
                      children: [
                        Text(item.emoji, style: const TextStyle(fontSize: 40)),

                        const SizedBox(width: 20),

                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Icon(
                          item.found
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color: item.found ? Colors.green : Colors.grey,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                onPressed: () async {
                  final imagePath = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CameraScreen()),
                  );

                  if (imagePath != null) {
                    final result = await GeminiService.identifyObject(
                      imagePath,
                    );

                    print(result);

                    processResult(result);
                  }
                },
                child: const Text("Start Exploring"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
