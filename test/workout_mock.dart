import 'package:my_workout/data/models/day_model.dart';
import 'package:my_workout/data/models/exercise_model.dart';
import 'package:my_workout/data/models/workout_model.dart';

class WorkoutMock{
  WorkoutModel getMockWorkout(){
    ExerciseModel exercise = ExerciseModel(
      name: 'Test',
      sets: 3,
      repetitions: 10,
      hash: '',
    );
    DayModel day = DayModel(
      day: 1,
      exercises: [exercise],
      hash: '',
    );
    WorkoutModel workout = WorkoutModel(
      name: 'Test',
      hash: '',
      days: [day],
    );
    return workout;
  }
}