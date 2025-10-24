import 'package:uuid/uuid.dart';

// UUID generator
var uuid = Uuid();

// Represent a single question in the quiz
class Question {
  final String id;
  final String title;
  final List<String> choices;
  final String goodChoice; 
  final int points;

  Question({
    String? id,
    required this.title,
    required this.choices,
    required this.goodChoice,
    this.points = 1,
  }) : id = id ?? uuid.v4();

  // Check if the answer is correct
  bool isCorrect(String selectedAnswer) {
    return selectedAnswer == goodChoice;
  }

  //Create Question from JSON
  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      title: json['title'],
      choices: List<String>.from(json['choices']),
      goodChoice: json['goodChoice'],
      points: json['points'] ?? 1,
    );
  }

  //Convert Question to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'choices': choices,
      'goodChoice': goodChoice,
      'points': points,
    };
  }
}

// a player's answer
class Answer {
  final String id;
  final String questionId;
  final String answerChoice; 

  Answer({
    String? id,
    required this.questionId,
    required this.answerChoice,
  }) : id = id ?? uuid.v4();

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

//Represents a quiz player
class Player {
  final String id;
  final String name;
  int score = 0; // % score
  int points = 0; // total points

  Player({
    String? id,
    required this.name,
  }) : id = id ?? uuid.v4();

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      id: json['id'],
      name: json['name'],
    )
      ..score = json['score'] ?? 0
      ..points = json['points'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'score': score,
      'points': points,
    };
  }
}

/// The Quiz class holds questions, players, and answers
class Quiz {
  final String id;
  List<Question> questions;
  List<Answer> answers = [];
  List<Player> players = [];

  Quiz({String? id, required this.questions}) : id = id ?? uuid.v4();

  // Get Question by ID
  Question getQuestionById(String questionId) {
    return questions.firstWhere(
      (q) => q.id == questionId,
      orElse: () => throw Exception('Question not found: $questionId'),
    );
  }

  // Get Player by ID
  Player getPlayerById(String playerId) {
    return players.firstWhere(
      (p) => p.id == playerId,
      orElse: () => throw Exception('Player not found: $playerId'),
    );
  }

  //Add a player to the quiz
  void addPlayer(Player player) {
    // If player exists, overwrite
    var existing = players.indexWhere((p) => p.name == player.name);
    if (existing >= 0) {
      players[existing] = player;
    } else {
      players.add(player);
    }
  }

  //Add answer to the quiz
  void addAnswer(Answer answer) {
    answers.add(answer);
  }

  // Calculate score in percentage based on answers
  int getScoreInPercentage(List<Answer> answers) {
    int correct = 0;
    for (var answer in answers) {
      var question = getQuestionById(answer.questionId);
      if (question.isCorrect(answer.answerChoice)) {
        correct++;
      }
    }
    return ((correct / questions.length) * 100).toInt();
  }

  //Calculate total points 
  int getPoint(List<Answer> answers) {
    int total = 0;
    for (var answer in answers) {
      var question = getQuestionById(answer.questionId);
      if (question.isCorrect(answer.answerChoice)) {
        total += question.points;
      }
    }
    return total;
  }

  //Create Quiz from json
  factory Quiz.fromJson(Map<String, dynamic> json) {
    var questionsJson = json['questions'] as List;
    var questions = questionsJson.map((q) => Question.fromJson(q)).toList();

    var quiz = Quiz(questions: questions);

    // Load players if present
    if (json['players'] != null) {
      var playersJson = json['players'] as List;
      quiz.players = playersJson.map((p) => Player.fromJson(p)).toList();
    }

    return quiz;
  }

  //Convert Quiz to json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questions': questions.map((q) => q.toJson()).toList(),
      'players': players.map((p) => p.toJson()).toList(),
    };
  }
}
