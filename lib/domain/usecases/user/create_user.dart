import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/repositories/user_repository.dart';

class CreateUser{
  final UserRepository repository;

  CreateUser(this.repository);

  Future<Either<Failure, String>> call(String username, String email, String password){
    return repository.createUser(username, email, password);
  }
}