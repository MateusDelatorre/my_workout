part of 'exercise_bloc.dart';

abstract class ExerciseEvent extends Equatable {
  const ExerciseEvent();
}

class ExerciseNameChangedEvent extends ExerciseEvent{
  const ExerciseNameChangedEvent(this.name);

  final String name;

  @override
  List<Object> get props => [name];
}

class ExerciseSeriesChangedEvent extends ExerciseEvent{
  const ExerciseSeriesChangedEvent(this.series);

  final int series;

  @override
  List<Object> get props => [series];
}

class ExerciseRepetitionsChangedEvent extends ExerciseEvent{
  const ExerciseRepetitionsChangedEvent(this.repetitions);

  final int repetitions;

  @override
  List<Object> get props => [repetitions];
}

class CreateExerciseEvent extends ExerciseEvent{
  const CreateExerciseEvent({
    required this.dayHash,
    required this.name,
    required this.series,
    required this.repetitions,
  });

  final String dayHash;
  final String name;
  final int series;
  final int repetitions;

  @override
  List<Object> get props => [dayHash, name, series, repetitions];
}