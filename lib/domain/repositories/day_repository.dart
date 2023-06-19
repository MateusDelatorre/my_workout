import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/day.dart';

abstract class DayRepository{
  Future<Either<Failure, Day>> createDay(int ordem, String workoutHash);
  Future<Either<Failure, bool>> deleteDay(String hash);
  Future<Either<Failure, bool>> updateDay(String hash, int ordem);
}