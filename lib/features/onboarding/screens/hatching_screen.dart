import 'package:cocoquest/core/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HatchingScreen extends StatefulWidget {
  const HatchingScreen({super.key});

  @override
  State<HatchingScreen> createState() => _HatchingScreenState();
}

class _HatchingScreenState extends State<HatchingScreen> {
  int stage = 0;

  final images = [
    'assets/mascot/egg_closed.png',
    'assets/mascot/egg_cracked.png',
    'assets/mascot/egg_peeking.png',
    'assets/mascot/egg_half.png',
    'assets/mascot/coco_happy.png',
  ];

  void nextStage() {
    if (stage < images.length - 1) {
      setState(() {
        stage++;
      });
    }
  }

  String getStageText() {
    switch (stage) {
      case 0:
        return "Tap the egg!";
      case 1:
        return "It's cracking!";
      case 2:
        return "Who's inside?";
      case 3:
        return "One more tap!";
      case 4:
        return "Hi Friend! 👋";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool finished = stage == 4;

    return Scaffold(
      backgroundColor: const Color(0xFFFDFBF6),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: finished ? null : nextStage,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 700),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return ScaleTransition(
                            scale: animation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                    child: Container(
                      key: ValueKey(stage),
                      child: AnimatedScale(
                        scale: finished ? 1.15 : 1.0,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.elasticOut,
                        child: Image.asset(images[stage], width: 260),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    getStageText(),
                    key: ValueKey(stage),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5E4B3C),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                if (!finished)
                  const Text(
                    "Tap Coco's egg to help him hatch!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),

                const SizedBox(height: 40),

                AnimatedOpacity(
                  opacity: finished ? 1 : 0,
                  duration: const Duration(milliseconds: 800),
                  child: finished
                      ? ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.home,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFA8E6CF),
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 16,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            "Start Adventure!",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
