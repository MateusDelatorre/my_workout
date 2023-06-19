import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/repositories/user_repository.dart';

class LogOut{
  final UserRepository repository;

  LogOut(this.repository);

  Future<Either<Failure, bool>> call(){
    return repository.logOut();
  }
}