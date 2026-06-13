import 'dart:math';

import 'package:flutter/material.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key});

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int stars = 0;
  int targetNumber = 0;

  List<int> balloons = [];

  bool showSuccess = false;
  bool showError = false;
  bool showCelebration = false;

  @override
  void initState() {
    super.initState();
    generateRound();
  }

  void generateRound() {
    final random = Random();

    targetNumber = random.nextInt(9) + 1;

    balloons = [];

    while (balloons.length < 4) {
      final number = random.nextInt(9) + 1;

      if (!balloons.contains(number)) {
        balloons.add(number);
      }
    }

    if (!balloons.contains(targetNumber)) {
      balloons[random.nextInt(4)] = targetNumber;
    }

    setState(() {});
  }

  void selectNumber(int number) {
    if (number == targetNumber) {
      setState(() {
        stars++;
        showSuccess = true;
        showCelebration = true;
        showError = false;
      });

      Future.delayed(const Duration(milliseconds: 1500), () {
        if (!mounted) return;

        setState(() {
          showSuccess = false;
          showCelebration = false;
        });

        generateRound();
      });
    } else {
      setState(() {
        showError = true;
      });

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (!mounted) return;

        setState(() {
          showError = false;
        });
      });
    }
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
          "Balloon Pop",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "⭐ $stars",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              /// Response
              if (showCelebration)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Great Job!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              else if (showError)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Text(
                    "Try Again!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                )
              else
                const SizedBox(height: 50),

              /// Coco
              Image.asset(
                showSuccess
                    ? 'assets/mascot/coco_celebrate.png'
                    : showError
                    ? 'assets/mascot/coco_sad.png'
                    : 'assets/mascot/coco_happy.png',
                width: 160,
              ),

              /// Speech Bubble
              Text(
                "Can you find number $targetNumber?",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: balloons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (_, index) {
                    return balloon(balloons[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget balloon(int number) {
    return GestureDetector(
      onTap: () => selectNumber(number),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text("🎈", style: TextStyle(fontSize: 100)),

          Text(
            "$number",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
