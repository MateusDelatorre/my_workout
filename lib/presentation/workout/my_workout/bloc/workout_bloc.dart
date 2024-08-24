import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/data/datasources/remote/workout_remote_data_source.dart';
import 'package:my_workout/data/repositories/workout_repository_impl.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/usecases/workout/create_workout.dart';
import 'package:my_workout/domain/usecases/workout/get_workout.dart';

part 'workout_event.dart';
part 'workout_state.dart';

class WorkoutBloc extends Bloc<WorkoutEvent, WorkoutState> {
  WorkoutBloc() : super(EmptyWorkoutState()) {
    on<CreateWorkoutEvent>(_onCreateWorkout);
    on<GetWorkoutEvent>(_onGetWorkout);
  }



  Future<void> _onCreateWorkout(
      CreateWorkoutEvent event,
      Emitter<WorkoutState> emit
      ) async {
    CreateWorkout uc = CreateWorkout(WorkoutRepositoryImpl(WorkoutRemoteDataSourceImpl()));
    var response = await uc(event.name);
    print("response: $response");
    if(response is Right){

      emit(WorkoutCreated(workout: (response as Right).value as Workout));
    }
  }

  Future<void> _onGetWorkout(
      GetWorkoutEvent event,
      Emitter<WorkoutState> emit
      ) async {
    print("loading");
    emit(WorkoutLoading());
    GetWorkout uc = GetWorkout(WorkoutRepositoryImpl(WorkoutRemoteDataSourceImpl()));
    var response = await uc(event.workout);
    print("response: $response");
    if(response is Right){
      emit(WorkoutLoaded(workout: (response as Right).value as Workout));
    }else{
      emit(EmptyWorkoutState());
    }
  }
}
