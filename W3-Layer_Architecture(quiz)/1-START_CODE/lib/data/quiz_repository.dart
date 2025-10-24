import 'dart:io';
import 'dart:convert';
import '../domain/quiz.dart';

//read and write Quiz JSON
class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  //Read quiz from JSON file
  Quiz readQuiz() {
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception('File not found: $filePath');
    }

    final content = file.readAsStringSync();
    final Map<String, dynamic> data = jsonDecode(content);

    return Quiz.fromJson(data);
  }

  // Write quiz (including players) to JSON 
  void writeQuiz(Quiz quiz) {
    final file = File(filePath);
    final encoder = JsonEncoder.withIndent('  ');
    file.writeAsStringSync(encoder.convert(quiz.toJson()));
    print('Quiz saved to $filePath');
  }
}
