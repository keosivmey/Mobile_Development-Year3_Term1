import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  final Quiz quiz;

  QuizConsole({required this.quiz});

  // Start the quiz for multiple players
  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    while (true) {
      stdout.write("Enter your name (empty to quit): ");
      String? playerName = stdin.readLineSync();

      if (playerName == null || playerName.trim().isEmpty) break;

      // Create or overwrite player
      var player = Player(name: playerName);
      quiz.addPlayer(player);

      List<Answer> playerAnswers = [];

      // Ask each question
      for (var question in quiz.questions) {
        print('\nQuestion: ${question.title} (${question.points} pts)');

        for (int i = 0; i < question.choices.length; i++) {
          print('${i + 1}. ${question.choices[i]}');
        }

        stdout.write('Your answer (1-${question.choices.length}): ');
        int? choiceIndex = int.tryParse(stdin.readLineSync() ?? '');

        if (choiceIndex != null &&
            choiceIndex >= 1 &&
            choiceIndex <= question.choices.length) {
          String selectedAnswer = question.choices[choiceIndex - 1];

          var answer = Answer(
            questionId: question.id,
            answerChoice: selectedAnswer,
          );

          playerAnswers.add(answer);
          quiz.addAnswer(answer);
        } else {
          print('Invalid choice. Skipping question.');
        }
      }

      // Calculate score
      player.score = quiz.getScoreInPercentage(playerAnswers);
      player.points = quiz.getPoint(playerAnswers);

      print(
          '\n${player.name}, your score: ${player.score}% | Points: ${player.points}');

      // Show all players
      print('\n--- All players scores ---');
      for (var p in quiz.players) {
        print('Player: ${p.name} | Score: ${p.score}% | Points: ${p.points}');
      }
      print('');
    }

    print('--- Quiz Finished ---');
  }
}
