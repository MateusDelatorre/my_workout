import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class CreateWorkout {

  final WorkoutRepository repository;

  CreateWorkout(this.repository);

  Future<Either<Failure, Workout>> call(String nome){
    return repository.createWorkout(nome);
  }
}