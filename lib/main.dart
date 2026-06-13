import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';

void main() {
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
