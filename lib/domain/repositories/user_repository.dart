import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';

abstract class UserRepository{
  Future<Either<Failure, String>> createUser(String username, String email, String password);
  Future<Either<Failure, String>> logIn(String email, String password);
  logOut();
}