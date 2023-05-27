import 'package:my_workout/domain/entities/workout.dart';

abstract class WorkoutRepository{
  Future<Workout> getWorkout();
  Future<Workout> createWorkout();
  Future<bool> deleteWorkout();
  Future<List<Workout>> getWorkoutList();
}