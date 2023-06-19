import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/repositories/day_repository.dart';

class CreateDay{
  DayRepository repository;

  CreateDay(this.repository);

  Future<Either<Failure, Day>> call(int ordem, String workoutHash){
    return repository.createDay(ordem, workoutHash);
  }
}