import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/data/models/workout_model.dart';
import 'package:my_workout/domain/entities/workout.dart';

class WorkoutLocalDataSource{
  late final BoxCollection collection;

  WorkoutLocalDataSource();

  Future<bool> openCollection() async {
    try{
      collection = await BoxCollection.open(
        'WorkoutDB', // Name of your database
        {'Workout', 'Day', 'Exercise'}, // Names of your boxes
      );
      return true;
    }catch(e){
      print("Error opening collection: ${e}");
      return false;
    }
  }

  Future<Either<Failure, String>> getHash() async {
    try{
      final workoutBox = await collection.openBox<WorkoutModel>('Workout');
      List<String> keys = await workoutBox.getAllKeys();
      return Right(keys.length.toString());
    }catch(e){
      print(e);
      return Left(Failure());
    }
  }

  Future<Either<Failure, WorkoutModel>> saveWorkout(WorkoutModel workout) async {
    try{
      int workoutHash = 0;
      print("Saving workout: ${workout.name}");
      print("workout hash: ${workout.hash}");
      final workoutBox = await collection.openBox<Map<String, dynamic>>('Workout');
      if(workout.hash.isEmpty){
        List<String> keys = await workoutBox.getAllKeys();
        workoutHash = keys.length + 1;
        workout = workout.copyWith(hash: workoutHash.toString());
      }
      print("workout hash: ${workout.hash}");
      await collection.transaction(
            () async {
              workoutBox.put(workout.hash, workout.toMap());
        },
        boxNames: ['Workout'], // By default all boxes become blocked.
        readOnly: false,
      );
      return Right(workout);
    }catch(e){
      print("Error saving workout: ${e}");
      print(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, WorkoutModel>> getWorkout(String hash) async {
    try{
      final workoutBox = await collection.openBox<Map<String, dynamic>>('Workout');
      print(workoutBox.runtimeType);
      final Map<String, dynamic>? workout = await workoutBox.get(hash);
      print(workout);
      return Right(WorkoutModel.fromJson(workout!));
    }catch(e){
      print(e);
      return Left(Failure());
    }
  }

  Future<bool> closeDayBox() async {
    try{

      return true;
    }catch(e){
      print(e);
      return false;
    }
  }
}