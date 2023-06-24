import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ddd/domain/core/failures.dart';

@immutable
abstract class ValueObject<T> extends Equatable {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;
}
