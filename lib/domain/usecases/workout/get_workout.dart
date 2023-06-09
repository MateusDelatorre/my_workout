import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class GetWorkout {
  final WorkoutRepository repository;

  GetWorkout(this.repository);

  Future<Either<Failure, Workout>> call(Workout workout){
    return repository.getWorkout(workout.hash);
  }
}