import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/workout/my_workout/bloc/workout_bloc.dart';

class MyWorkout extends StatelessWidget {
  const MyWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
      builder: (context, state){
        if(state is WorkoutLoaded){
          return ListView.builder(
              itemCount: state.workout.days.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(state.workout.days.elementAt(index).day.toString()),
                );
              }
          );
        }else{
          return Container();
        }
      }
    );
  }
}
