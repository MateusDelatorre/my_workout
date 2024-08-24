import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class WorkoutUseCases{
  final WorkoutRepository _workoutRepository;

  WorkoutUseCases(this._workoutRepository);

  Future<Either<Failure, List<Workout>>> getWorkouts() async {
    return await _workoutRepository.getWorkouts();
  }

  Future<Either<Failure, Workout>> createWorkout(String nome){
    return _workoutRepository.createWorkout(nome);
  }

  Future<Either<Failure, bool>> deleteWorkout(String hash){
    return _workoutRepository.deleteWorkout(hash);
  }

  Future<Either<Failure, Workout>> getWorkout(String hash){
    return _workoutRepository.getWorkout(hash);
  }
}