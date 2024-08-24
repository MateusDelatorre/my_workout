import 'package:flutter/material.dart';
import 'package:my_workout/data/datasources/local/workout_local_data_source.dart';
import 'package:my_workout/data/models/day_model.dart';
import 'package:my_workout/data/models/exercise_model.dart';
import 'package:my_workout/data/models/workout_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            WorkoutModel workoutModel;
            final workoutLocalDataSource = WorkoutLocalDataSource();
            final bool = await workoutLocalDataSource.openCollection();
            print("openCollection: $bool");
            final saveResult = await workoutLocalDataSource.saveWorkout(WorkoutMock().getMockWorkout());
            if(saveResult.isRight()){
              workoutModel = saveResult.getOrElse(() => WorkoutModel(hash: '', name: '', days: []));
              if(workoutModel.hash.isNotEmpty){
                final getWorkoutResult = await workoutLocalDataSource.getWorkout(workoutModel.hash);
                if(getWorkoutResult.isRight()){
                  workoutModel = getWorkoutResult.getOrElse(() => WorkoutModel(hash: '', name: '', days: []));
                  print("Workout: ${workoutModel.name}");
                }
              }
            }
          },
          child: Text('Test'),
        ),
      ),
    );
  }
}

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