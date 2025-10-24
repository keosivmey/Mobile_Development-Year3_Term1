import 'dart:io';
import '../domain/quiz.dart';

class QuizConsole {
  Quiz quiz;

  QuizConsole({required this.quiz});

  void startQuiz() {
    print('--- Welcome to the Quiz ---\n');

    // Loop to allow multiple players
    while (true) {
      stdout.write("Your name: ");
      String? playerName = stdin.readLineSync();

      // Exit if no name is provided
      if (playerName == null || playerName.trim().isEmpty) {
        break;
      }

      // Add players to the quiz
      quiz.addPlayer(Player(name: playerName));

      // Player takes quiz
      List<Answer> playerAnswers = [];

      for (var question in quiz.questions) {
        print('Question: ${question.title} - (${question.point} points)');
        
        // Display choices with numbers for better UX
        for (int i = 0; i < question.choices.length; i++) {
          print('${i + 1}. ${question.choices[i]}');
        }
        
        stdout.write('Your answer (1-${question.choices.length}): ');
        String? userInput = stdin.readLineSync();
        int? choiceIndex = int.tryParse(userInput ?? '');

        // Check for valid input
        if (choiceIndex != null && choiceIndex >= 1 && choiceIndex <= question.choices.length) {
          String selectedAnswer = question.choices[choiceIndex - 1];
          
          // Create answer with question ID reference
          Answer answer = Answer(
            questionId: question.id, // Use question ID instead of object
            answerChoice: selectedAnswer
          );
          playerAnswers.add(answer);
          quiz.addAnswer(answer);
        } else {
          print('Invalid choice. Skipping question.');
        }

        print('');
      }

      // Calculate score and points for players
      quiz.players.last.score = quiz.getScoreInPercentage(playerAnswers);
      quiz.players.last.point = quiz.getPoint(playerAnswers);

      print("${quiz.players.last.name}, your score in percentage: ${quiz.players.last.score} %");
      print("${quiz.players.last.name}, your score in points: ${quiz.players.last.point}");

      // Display all players scores
      print("\nAll players scores:");
      for (var player in quiz.players) {
        print("Player: ${player.name}\t\tScore: ${player.score}% \tPoints: ${player.point}");
      }
      print('');
    }

    print('--- Quiz Finished ---');
  }
}