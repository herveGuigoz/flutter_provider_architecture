import '../exceptions/input_exception.dart';

// helper class to parser input string to integer and validate it.
class InputParser {
  static int parse(String userIdText) {
    var userId = int.tryParse(userIdText);
    if (userId == null) {
      throw NotNumberException();
    }
    if (userId < 1 || userId > 10) {
      throw NotInRangeException();
    }
    return userId;
  }
}
