import 'dart:io';
import 'dart:convert';
import '../domain/quiz.dart';

class QuizRepository {
  final String filePath;

  QuizRepository(this.filePath);

  // read quiz from JSON file
  Quiz readQuiz() {
    final file = File(filePath);
    final content = file.readAsStringSync();
    Map<String, dynamic> data = jsonDecode(content);

    // Map JSON to domain objects
    var questionsJson = data['questions'] as List;
    var questions = questionsJson.map((q) {
      return Question(
        id: q['id'],
        title: q['title'],
        choices: List<String>.from(q['choices']),
        goodChoice: q['goodChoice'],
        point: q['points'] ?? 1,
      );
    }).toList();

    var quiz = Quiz(questions: questions);

    // load players
    if (data['players'] != null) {
      var playersJson = data['players'] as List;
      quiz.players = playersJson.map((p) {
        return Player(
          id: p['id'],
          name: p['name'],
        )
          ..score = p['score'] ?? 0
          ..point = p['point'] ?? 0;
      }).toList();
    }

    return quiz;
  }

  // Write Quiz to JSON file (excluding answers)
  void writeQuiz(Quiz quiz) {
    // Convert Quiz to JSON format excluding answers
    Map<String, dynamic> quizResultJson = {
      'questions': quiz.questions.map((q) => q.toJson()).toList(),
      'players': quiz.players.map((p) => p.toJson()).toList(),
    };

    final file = File(filePath);

    final encoder = JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(quizResultJson);

    // Write to file
    file.writeAsStringSync(prettyJson);
    print('Quiz saved to $filePath');
  }
}