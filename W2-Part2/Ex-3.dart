class CustomDuration {
  final int _milliseconds; // Stored as milliseconds
  
  //main constructor 
  CustomDuration(this._milliseconds) {
    if (_milliseconds < 0) {
      throw Exception('Duration must be equal or greater than 0');
    }
  }

  //name constructor
  CustomDuration.fromHours(int hours) : _milliseconds = hours * 3600 * 1000;
  CustomDuration.fromMinutes(int minutes): _milliseconds = minutes * 60 * 1000;
  CustomDuration.fromSeconds(int seconds): _milliseconds = seconds * 1000;

  //getter 
  double get seconds => _milliseconds / 1000;
  double get minutes => _milliseconds / 60000;
  double get hours => _milliseconds / 3600000;
  
  //operator
  bool operator >(CustomDuration other) {
    return _milliseconds > other._milliseconds;
  }

  CustomDuration operator +(CustomDuration other) {
    return CustomDuration(_milliseconds + other._milliseconds);
  }
  
  CustomDuration operator -(CustomDuration other) {
    if (this > other || _milliseconds == other._milliseconds) {
      return CustomDuration(_milliseconds - other._milliseconds);
    }
    throw Exception('The first duration must be greater than or equal to the second duration.');
  }

   @override
  String toString() => 'CustomDuration($_milliseconds ms)';
}

  void main() {
  var d1 = CustomDuration.fromMinutes(2);
  var d2 = CustomDuration.fromSeconds(10);

  print(d1 > d2); // true
  print(d1 + d2); // 130000 ms
  print(d1 - d2); // 110000 ms
  print(d1.hours); // 0.033
}
