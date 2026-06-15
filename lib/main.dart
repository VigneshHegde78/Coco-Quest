import 'package:cocoquest/core/game_progress.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await GameProgress.load();
  } catch (e) {
    print("Failed to load game progress: $e");
  }

  runApp(const CocoQuestApp());
}

class CocoQuestApp extends StatelessWidget {
  const CocoQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coco Quest',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
    );
  }
}
