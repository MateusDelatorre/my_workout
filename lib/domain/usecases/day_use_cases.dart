import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/repositories/day_repository.dart';

class DayUseCases{
  final DayRepository _dayRepository;

  DayUseCases(this._dayRepository);

  Future<Either<Failure, Day>> createDay(int ordem, String workoutHash){
    return _dayRepository.createDay(ordem, workoutHash);
  }
  Future<Either<Failure, bool>> deleteDay(String hash){
    return _dayRepository.deleteDay(hash);
  }
  Future<Either<Failure, bool>> updateDay(String hash, int ordem){
    return _dayRepository.updateDay(hash, ordem);
  }
}