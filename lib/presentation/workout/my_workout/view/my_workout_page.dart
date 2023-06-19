import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/day/bloc/day_bloc.dart';
import 'package:my_workout/presentation/day/view/day_page.dart';
import 'package:my_workout/presentation/exercise/bloc/exercise_bloc.dart';
import 'package:my_workout/presentation/workout/my_workout/bloc/workout_bloc.dart';

class MyWorkoutPage extends StatelessWidget {
  const MyWorkoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkoutBloc, WorkoutState>(
        builder: (context, state) {
          if (state is WorkoutLoading) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is WorkoutLoaded) {
            return Scaffold(
              appBar: AppBar(
                title: Text(state.workout.name),
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
              body: BlocListener<DayBloc, DayState>(
                listener: (context, dayState) {
                  if(dayState is DayLoadedState){
                    context.read<WorkoutBloc>().add(GetWorkoutEvent(workout: state.workout));
                  }
                  //if(dayState is DayErrorState){
                    // Presenter().showAlertDialog(
                    //   context: context,
                    //   title: "erro ao criar dia",
                    // );
                  // }if(dayState is DayLoadingState){
                  //   Presenter().showSnackBar(context, Presenter().showSuccess('carregando'));
                  // }
                },
                child: BlocBuilder<DayBloc, DayState>(
                  builder: (context, dayState) {
                    if (dayState is DayLoadingState) {
                      return const Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("carregando"),
                          ],
                      );
                    }
                    return state.workout.days.isEmpty ?
                    const Center(
                      child: Text("Sem dias"),
                    ) :
                    ListView.builder(
                        itemCount: state.workout.days.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: InkWell(
                              onTap: (){
                                //context.read<WorkoutBloc>().add(GetWorkoutEvent(workout: workouts.elementAt(index)));
                                WorkoutBloc workout = context.read<WorkoutBloc>();
                                AuthenticationBloc authenticationBloc = context.read<AuthenticationBloc>();
                                DayBloc dayBloc = context.read<DayBloc>();
                                dayBloc.emit(DayLoadedState(day: state.workout.days.elementAt(index)));
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
                                        child: const DayPage(),
                                      )
                                  ),
                                );
                              },
                              child: ListTile(
                                title: Text("Dia: ${state.workout.days
                                    .elementAt(index)
                                    .day
                                    .toString()}"),
                                //leading: Text('Days: ${workouts.elementAt(index).days.length}'),
                              ),
                            ),
                          );
                        }
                    );
                  },
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                onPressed: context.read<DayBloc>().state is DayLoadingState ?
                  null :
                  () {
                  context.read<DayBloc>().add(CreateDayEvent(
                        ordem: state.workout.days.length,
                        workoutHash: state.workout.hash,));
                },
                label: context.read<DayBloc>().state is DayLoadingState ? const CircularProgressIndicator() : const Text("Criar Dia"),
              ),
            );
          } else {
            return const Center(
              child: Text("Algo de errado não esta certo"),
            );
          }
        }
    );
  }
}
