import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class DeleteWorkout {
  final WorkoutRepository repository;

  DeleteWorkout(this.repository);

  Future<Either<Failure, bool>> call(Workout workout){
    return repository.deleteWorkout(workout.hash);
  }
}