import 'dart:io';

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  static const apiKey = 'Gemini API Key Here';

  static Future<String> identifyObject(String imagePath) async {
    final model = GenerativeModel(model: 'gemini-2.5-flash', apiKey: apiKey);
    final imageBytes = await File(imagePath).readAsBytes();

    final prompt = TextPart('''
Look at this image.

Identify the main object.

Respond with ONLY one lowercase word.

Examples:
book
chair
spoon
table
phone
''');

    final imagePart = DataPart('image/jpeg', imageBytes);

    try {
      final response = await model.generateContent([
        Content.multi([prompt, imagePart]),
      ]);

      return response.text?.trim().toLowerCase() ?? '';
    } catch (e) {
      print("Gemini Error: $e");
      return '';
    }
  }
}
