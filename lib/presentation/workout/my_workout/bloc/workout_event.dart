part of 'workout_bloc.dart';

abstract class WorkoutEvent extends Equatable {
  const WorkoutEvent();
}

class CreateWorkoutEvent extends WorkoutEvent {
  const CreateWorkoutEvent({required this.name});

  final String name;

  @override
  List<Object?> get props => [name];

}

class CrudWorkout extends WorkoutEvent{
  final Workout workout;

  const CrudWorkout({required this.workout});

  @override
  List<Object?> get props => [workout.hash, workout.name];
}

class GetWorkoutEvent extends CrudWorkout {
  const GetWorkoutEvent({required super.workout});
}

class UpdateWorkoutEvent extends CrudWorkout{
  const UpdateWorkoutEvent({required super.workout});
}