import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_repository.dart';

void main() {
  // Use relative paths instead of absolute paths
  QuizRepository repository = QuizRepository('data/quiz.json');
  Quiz quiz = repository.readQuiz();

  print('Quiz loaded with ${quiz.questions.length} questions');
  print('Existing players: ${quiz.players.length}');
  print('Existing answers: ${quiz.answers.length}');

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();

  // Save results to a different file
  QuizRepository resultsRepo = QuizRepository('data/quiz_result.json');
  resultsRepo.writeQuiz(quiz);
}