import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';

abstract class WorkoutRepository{
  Future<Either<Failure, Workout>> createWorkout(String nome);
  Future<Either<Failure, bool>> deleteWorkout(String hash);
  Future<Either<Failure, Workout>> getWorkout(String hash);
  Future<Either<Failure, List<Workout>>> getWorkoutList();
}