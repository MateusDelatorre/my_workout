import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/repositories/user_repository.dart';

class LoginIn{
  final UserRepository repository;

  LoginIn(this.repository);

  Future<Either<Failure, String>> call(String email, String password){
    return repository.logIn(email, password);
  }
}