import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/data/datasources/exercise_remote_data_source.dart';
import 'package:my_workout/data/repositories/exercise_repository_impl.dart';
import 'package:my_workout/domain/usecases/exercise/create_exercise.dart';

part 'exercise_event.dart';
part 'exercise_state.dart';

class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  ExerciseBloc() : super(const ExerciseState()) {
    on<ExerciseNameChangedEvent>(_onNameChanged);
    on<ExerciseSeriesChangedEvent>(_onSeriesChanged);
    on<ExerciseRepetitionsChangedEvent>(_onRepetitionsChanged);
    on<CreateExerciseEvent>(_onCreateExercise);
  }

  void _onNameChanged(
      ExerciseNameChangedEvent event,
      Emitter<ExerciseState> emit,
      ){
    final name = event.name;
    emit(
      state.copyWith(
        name: name,
      ),
    );
  }

  void _onSeriesChanged(
      ExerciseSeriesChangedEvent event,
      Emitter<ExerciseState> emit,
      ){
    final series = event.series;
    emit(
      state.copyWith(
        series: series,
      ),
    );
  }

  void _onRepetitionsChanged(
      ExerciseRepetitionsChangedEvent event,
      Emitter<ExerciseState> emit,
      ){
    final repetitions = event.repetitions;
    emit(
      state.copyWith(
        repetitions: repetitions,
      ),
    );
  }

  Future<void> _onCreateExercise(
      CreateExerciseEvent event,
      Emitter<ExerciseState> emit
      ) async {
    print("trying:");
    CreateExercise uc = CreateExercise(ExerciseRepositoryImpl(ExerciseRemoteDataSourceImpl()));
    var response = await uc(event.dayHash, event.name, event.series.toString(), event.repetitions.toString());
    print("response: $response");
    if(response is Right){
      emit(ExerciseCreatedState());
    }
  }
}
