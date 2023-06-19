import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/workout/my_workout/bloc/workout_bloc.dart';
import 'package:my_workout/presentation/workout/workout_list/cubit/workout_list_cubit.dart';
import 'package:my_workout/presentation/workout/workout_list/view/workout_list.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkoutListCubit>(
          create: (BuildContext context) => WorkoutListCubit(),
        ),
        BlocProvider<WorkoutBloc>(
          create: (BuildContext context) => WorkoutBloc(),
        ),
      ],
      child: const WorkoutList(),
    );
  }
}
