import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/repositories/day_repository.dart';

class UpdateDay{
  DayRepository repository;

  UpdateDay(this.repository);

  Future<Either<Failure, bool>> call(Day day){
    return repository.updateDay(day.hash, day.day);
  }
}