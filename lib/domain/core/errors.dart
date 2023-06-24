import 'package:flutter_ddd/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        "Encountered a ValueFailure at an uncoverable point. Terminating.";
    return Error.safeToString("$explanation Failure was: $valueFailure");
  }
}
