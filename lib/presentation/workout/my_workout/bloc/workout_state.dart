part of 'workout_bloc.dart';

abstract class WorkoutState extends Equatable {
}

class EmptyWorkoutState extends WorkoutState {
  EmptyWorkoutState();

  @override
  List<Object> get props => [];
}

class WorkoutLoaded extends WorkoutState{
  final Workout workout;

  WorkoutLoaded({required this.workout});

  @override
  List<Object> get props => [workout.hash, workout.name];

  WorkoutLoaded copyWith({
    required Workout workout
  }){
    return WorkoutLoaded(workout: workout);
  }
}

class WorkoutCreated extends WorkoutLoaded{
  WorkoutCreated({required super.workout});
}

class WorkoutLoading extends WorkoutState{
  WorkoutLoading();
  @override
  List<Object> get props => [];
}