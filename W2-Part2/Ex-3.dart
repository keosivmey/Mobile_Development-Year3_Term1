//Exercise 3 - create a custom duration class
class Duration {
  final int _milliseconds; //default as milliseconds

  Duration (this._milliseconds) {
    if(this._milliseconds < 0) throw Exception('Duration must be greater than 0');
  }

  Duration.fromHours(int hours) : this(hours * 3600 * 1000);
  Duration.fromMinutes(int minutes) : this(minutes * 60 * 1000);
  Duration.fromSeconds(int seconds) : this(seconds * 1000); 

  //getter for disferent duration
  double get seconds => double.parse((this._milliseconds / 1000).toStringAsFixed(2));
  double get minutes => double.parse((this._milliseconds / 60000).toStringAsFixed(2));
  double get hours => double.parse((this._milliseconds / 3600000).toStringAsFixed(2));

  //overload operator
  //compare 2 duration 
  bool operator >(Duration other) {
    return this._milliseconds > other._milliseconds;
  }

  //add 2 duraions
  Duration operator +(Duration other) {
    return Duration(this._milliseconds + other._milliseconds);
  }

  //minus 2 duraions
  Duration operator -(Duration other) {
    if(this > other || this._milliseconds == other._milliseconds){
        return Duration(this._milliseconds - other._milliseconds);
    }
    throw Exception('The first duration must be greather than second duration.');
  }
}
