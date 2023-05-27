import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class GetWorkout {
  final WorkoutRepository repository;

  GetWorkout(this.repository);

  Future<Workout> getWorkout(){
    return repository.getWorkout();
  }
}