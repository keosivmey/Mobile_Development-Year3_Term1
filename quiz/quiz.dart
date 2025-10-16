class Question {
  final String title;
  final List<String> choices;
  final String goodChoice;

  Question( this.title, this.choices, this.goodChoice) ;
}

class Answer {
  final String answerChoice;
  final bool isGoodAnswer;
  final Question question;

  Answer(this.answerChoice, this.isGoodAnswer, this.question);
}

class Quiz {
  final List<Question> questions = [];
  final List<Answer> answers= [];

  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  int getScore() {
    int score = 0; 
    for (var answer in answers) {
      if (answer.isGoodAnswer) {
        score++;
      }
    }

    return score;

  }
}

