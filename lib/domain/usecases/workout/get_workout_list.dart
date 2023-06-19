import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class GetWorkoutList {
  final WorkoutRepository repository;

  GetWorkoutList(this.repository);

  Future<Either<Failure, List<Workout>>> call() {
    return repository.getWorkoutList();
  }
}