import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/day/bloc/day_bloc.dart';
import 'package:my_workout/presentation/exercise/bloc/exercise_bloc.dart';
import 'package:my_workout/presentation/exercise/view/exercise_page.dart';
import 'package:my_workout/presentation/workout/my_workout/bloc/workout_bloc.dart';

class DayPage extends StatelessWidget {
  const DayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DayBloc, DayState>(
      listener: (context, state) {
        // if(state is DayLoadedState && context.read<WorkoutBloc>().state is WorkoutLoaded){
        //   WorkoutLoaded workoutState = context.read<WorkoutBloc>().state as WorkoutLoaded;
        //   context.read<WorkoutBloc>().add(GetWorkoutEvent(workout: workoutState.workout));
        // }
      },
      child: BlocBuilder<DayBloc, DayState>(
        builder: (context, state) {
          print(state.runtimeType);
          if (state is DayLoadingState) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }else if (state is DayErrorState) {
            return const Center(
              child: Text("Algo de errado não esta certo"),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.day.day.toString()),
                actions: [
                  PopupMenuButton(
                      onSelected: (item) {
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                            value: 0,
                            child: Text(""))
                      ])
                ],
              ),
              body: state.day.exercises.isEmpty ?
              const Center(
                child: Text("Sem exercicios"),
              ) :
              ListView.builder(
                  itemCount: state.day.exercises.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(state.day.exercises.elementAt(index).name),
                        subtitle: Text(
                            "series : ${state.day.exercises.elementAt(index).sets.toString()} Repetitions: ${state.day.exercises.elementAt(index).repetitions.toString()}"),
                      ),
                    );
                  }
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: () {
                  //context.read<WorkoutBloc>().add(GetWorkoutEvent(workout: workouts.elementAt(index)));
                  WorkoutBloc workout = context.read<WorkoutBloc>();
                  AuthenticationBloc authenticationBloc = context.read<AuthenticationBloc>();
                  DayBloc dayBloc = context.read<DayBloc>();
                  String dayHash = state.day.hash;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(value: workout),
                            BlocProvider.value(value: authenticationBloc),
                            BlocProvider.value(value: dayBloc),
                            BlocProvider(
                              create: (context) => ExerciseBloc(),
                            )
                          ],
                          child: ExercisePage(dayHash: dayHash,),
                        )
                    ),
                  ).then((value) => (){dayBloc.add(UpdateDayEvent(day: dayBloc.state.day));});
                },
                label: context.read<DayBloc>().state is DayLoadingState ? const CircularProgressIndicator() : const Text("Criar Exercicio"),
              ),
            );

          }
        }
    ),
);
  }
}
