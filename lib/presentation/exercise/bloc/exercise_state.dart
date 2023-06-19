part of 'exercise_bloc.dart';

class ExerciseState extends Equatable {
  final String hash;
  final String name;
  final int series;
  final int repetitions;

  const ExerciseState({
    this.hash = '',
    this.name = '',
    this.series = 0,
    this.repetitions = 0,
  });

  @override
  List<Object?> get props => [hash, name, series, repetitions];

  ExerciseState copyWith({
    String? hash,
    String? name,
    int? series,
    int? repetitions,
  }) {
    return ExerciseState(
      hash: hash ?? this.hash,
      name: name ?? this.name,
      series: series ?? this.series,
      repetitions: repetitions ?? this.repetitions,
    );
  }
}

class ExerciseCreatedState extends ExerciseState{}
