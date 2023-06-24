import 'package:dartz/dartz.dart';
import 'package:flutter_ddd/domain/core/failures.dart';
import 'package:flutter_ddd/domain/core/value_objects.dart';
import 'package:flutter_ddd/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  const EmailAddress._(this.value);

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  @override
  List<Object?> get props => [value];
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;
  const Password._(this.value);

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  @override
  List<Object?> get props => [value];
}
