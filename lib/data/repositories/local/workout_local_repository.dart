import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/data/datasources/workout_data_source.dart';
import 'package:my_workout/data/models/workout_model.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class WorkoutLocalRepository extends WorkoutRepository {

  final WorkoutDataSource workoutDataSource;

  WorkoutLocalRepository({required this.workoutDataSource});

  @override
  Future<Either<Failure, Workout>> createWorkout(String nome) {
    try{
      final workout = WorkoutModel.forList(hash: '', name: nome);
      return Future.value(Right(workout));
    }catch(e){
      return Future.value(Left(Failure()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteWorkout(String hash) {
    // TODO: implement deleteWorkout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Workout>> getWorkout(String hash) {
    // TODO: implement getWorkout
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() {
    // TODO: implement getWorkouts
    throw UnimplementedError();
  }

}