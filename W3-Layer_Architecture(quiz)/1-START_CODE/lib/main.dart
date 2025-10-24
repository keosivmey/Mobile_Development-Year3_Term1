import 'domain/quiz.dart';
import 'ui/quiz_console.dart';
import 'data/quiz_repository.dart';

void main() {
  // Load quiz from JSON
  QuizRepository repository = QuizRepository('data/quiz.json');
  Quiz quiz = repository.readQuiz();

  print('Quiz loaded with ${quiz.questions.length} questions');

  QuizConsole console = QuizConsole(quiz: quiz);
  console.startQuiz();

  // Save results
  QuizRepository resultsRepo = QuizRepository('data/quiz_result.json');
  resultsRepo.writeQuiz(quiz);
}
