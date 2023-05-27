import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class CreateWorkout {

  final WorkoutRepository repository;

  CreateWorkout(this.repository);

  Future<Workout> createWorkout(){
    return repository.createWorkout();
  }
}