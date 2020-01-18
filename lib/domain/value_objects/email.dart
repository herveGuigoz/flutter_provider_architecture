import 'package:clean_architecture/domain/exceptions/validation_exception.dart';
import 'package:flutter/material.dart';

//value objects are immutable
@immutable
class Email {
  Email(this.email) {
    if (!email.contains('@')) {
      //Validation at the time of construction
      throw ValidationException('Your email must contain "@"');
    }
  }
  final String email;
}
