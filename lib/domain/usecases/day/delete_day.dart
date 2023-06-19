import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/repositories/day_repository.dart';

class DeleteDay{
  DayRepository repository;

  DeleteDay(this.repository);

  Future<Either<Failure, bool>> call(Day day){
    return repository.deleteDay(day.hash);
  }
}