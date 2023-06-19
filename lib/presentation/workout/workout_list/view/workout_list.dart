import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/day/bloc/day_bloc.dart';
import 'package:my_workout/presentation/widgets/presenter.dart';
import 'package:my_workout/presentation/workout/my_workout/bloc/workout_bloc.dart';
import 'package:my_workout/presentation/workout/my_workout/view/my_workout_page.dart';
import 'package:my_workout/presentation/workout/workout_list/cubit/workout_list_cubit.dart';

class WorkoutList extends StatelessWidget {
  const WorkoutList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('title'),
        // leading: IconButton(
        //   onPressed: (){
        //     context.read<WorkoutListCubit>().getWorkoutList();
        //   },
        //
        //   icon: const Icon(Icons.add),
        // ),
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
      body: BlocListener<WorkoutBloc, WorkoutState>(
        listener: (context, state) {
          if(state is WorkoutCreated){
            print("reload");
            context.read<WorkoutListCubit>().getWorkoutList();
          }
        },
        child: BlocBuilder<WorkoutListCubit, WorkoutListState>(
          builder: (context, state){
            if(state is LoadedState){
              final workouts = state.workoutList;

              return ListView.builder(
                itemCount: workouts.length,
                itemBuilder: (context, index){
                  return Card(
                    child: InkWell(
                      onTap: (){
                        context.read<WorkoutBloc>().add(GetWorkoutEvent(workout: workouts.elementAt(index)));
                        WorkoutBloc workout = context.read<WorkoutBloc>();
                        AuthenticationBloc authenticationBloc = context.read<AuthenticationBloc>();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(value: workout),
                                    BlocProvider.value(value: authenticationBloc),
                                    BlocProvider(
                                        create: (context) => DayBloc(),
                                    )
                                  ],
                                  child: const MyWorkoutPage(),
                              )
                          ),
                        );
                      },
                      child: ListTile(
                        title: Text(workouts.elementAt(index).name),
                        //leading: Text('Days: ${workouts.elementAt(index).days.length}'),
                      ),
                    ),
                  );
                }
              );
            }else if(state is LoadingState){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else if(state is ErrorState){
              return const Center(
                child: Text("Algo de errado não esta certo"),
              );
            }else{
              return const Center(
                child: Text('app state not found'),
              );
            }
          },
      ),
),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Presenter().showMyInputDialog(
              context: context,
              title: "Criar treino",
              onAcceptButtonPressed: (String value){_createWorkout(context, value);},
              onFieldSubmitted: (String value) {_createWorkout(context, value);},
              acceptButtonTitle: "criar",
              onCancelButtonPressed: (){
                Navigator.of(context).pop();
              },
              cancelButtonTitle: "cancelar",
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _createWorkout(BuildContext context, String name){
    context.read<WorkoutBloc>().add(CreateWorkoutEvent(name: name));
    Navigator.of(context).pop();
  }
}
