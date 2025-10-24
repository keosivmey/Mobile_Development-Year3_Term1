import 'package:uuid/uuid.dart';

// Create UUID instance
var uuid = Uuid();

class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice;
  final int point;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    int point = 1,
  })  : this.point = point,
        this.id = id ?? uuid.v4();  // Use UUID v4

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      choices: List<String>.from(json['choices']),
      goodChoice: json['goodChoice'],
      point: json['points'] ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': point,
    };
  }

  bool isCorrect(String answer) => answer == goodChoice;
}

class Answer {
  final String id;
  final String questionId;
  final String answerChoice;

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? uuid.v4();  // Use UUID v4

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      id: json['id'],
      questionId: json['questionId'],
      answerChoice: json['answerChoice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'answerChoice': answerChoice,
    };
  }
}

class Player {
  final String id;
  final String name;
  int score = 0;
  int point = 0;

  Player({
    String? id,
    required this.name,
  }) : id = id ?? uuid.v4();  // Use UUID v4

  void updateScore(int score) {
    this.score += score;
  }

  void updatePoint(int points) {
    this.point += points;
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
    )
      ..score = json['score'] ?? 0
      ..point = json['point'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'point': point,
    };
  }
}

class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({
    String? id,
    required this.questions,
  }) : id = id ?? uuid.v4();  // Use UUID v4

  // GETTERS TO RETRIEVE OBJECTS BY ID
  Question getQuestionById(String questionId) {
    return questions.firstWhere(
      (q) => q.id == questionId,
      orElse: () => throw Exception('Question not found: $questionId')
    );
  }

  Answer getAnswerById(String answerId) {
    return answers.firstWhere(
      (a) => a.id == answerId,
      orElse: () => throw Exception('Answer not found: $answerId')
    );
  }

  Player getPlayerById(String playerId) {
    return players.firstWhere(
      (p) => p.id == playerId,
      orElse: () => throw Exception('Player not found: $playerId')
    );
  }

  void addAnswer(Answer answer) {
    this.answers.add(answer);
  }

  void addPlayer(Player player) {
    this.players.add(player);
  }

  int getScoreInPercentage(List<Answer> answers) {
    int totalSScore = 0;
    for (Answer answer in answers) {
      Question question = getQuestionById(answer.questionId);
      if (question.isCorrect(answer.answerChoice)) {
        totalSScore++;
      }
    }
    return ((totalSScore / questions.length) * 100).toInt();
  }

  int getPoint(List<Answer> answers) {
    int totalPoint = 0;
    for (Answer answer in answers) {
      Question question = getQuestionById(answer.questionId);
      if (question.isCorrect(answer.answerChoice)) {
        totalPoint += question.point;
      }
    }
    return totalPoint;
  }
}