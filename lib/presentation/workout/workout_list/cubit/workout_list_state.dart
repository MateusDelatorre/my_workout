part of 'workout_list_cubit.dart';

abstract class WorkoutListState extends Equatable {
  const WorkoutListState();
}

class WorkoutListInitial extends WorkoutListState {
  @override
  List<Object> get props => [];
}

class LoadingState extends WorkoutListState {
  @override
  List<Object> get props => [];
}

class LoadedState extends WorkoutListState {
  const LoadedState(this.workoutList);

  final List<Workout> workoutList;

  @override
  List<Object> get props => [workoutList];
}

class ErrorState extends WorkoutListState {
  @override
  List<Object> get props => [];
}