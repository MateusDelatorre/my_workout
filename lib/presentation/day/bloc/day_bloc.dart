import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/data/datasources/day_remote_data_source.dart';
import 'package:my_workout/data/repositories/day_repository_impl.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/entities/exercise.dart';
import 'package:my_workout/domain/usecases/day/create_day.dart';
import 'package:my_workout/domain/usecases/day/delete_day.dart';
import 'package:my_workout/domain/usecases/day/update_day.dart';

part 'day_event.dart';
part 'day_state.dart';

class DayBloc extends Bloc<DayEvent, DayState> {
  DayBloc() : super(const DayState()) {
    on<DayEvent>((event, emit) {
      on<CreateDayEvent>(_onCreateDay);
      on<UpdateDayEvent>(_onUpdateDay);
      on<DeleteDayEvent>(_onDeleteDay);
    });
  }

  Future<void> _onCreateDay(
      CreateDayEvent event,
      Emitter<DayState> emit,
      ) async {
    emit(const DayLoadingState());
    try{
      CreateDay uc = CreateDay(DayRepositoryImpl(DayRemoteDataSourceImpl()));
      var response = await uc(event.ordem, event.workoutHash);
      if(response is Right){
        Day day = (response as Right).value;
        emit(DayLoadedState(day: day));
      }else{
        emit(const DayErrorState());
      }
    }catch (e){
      print(e.toString());
      emit(const DayErrorState());
    }
  }

  Future<void> _onUpdateDay(
      UpdateDayEvent event,
      Emitter<DayState> emit,
      ) async {
    emit(const DayLoadingState());
    try{
      UpdateDay uc = UpdateDay(DayRepositoryImpl(DayRemoteDataSourceImpl()));
      var response = await uc(event.day);
      if(response is Right){
        Day day = (response as Right).value;
        print(day.toString());
        emit(DayLoadedState(day: day));
      }else{
        emit(const DayErrorState());
      }
    }catch (e){
      print(e.toString());
      emit(const DayErrorState());
    }
  }

  Future<void> _onDeleteDay(
      DeleteDayEvent event,
      Emitter<DayState> emit,
      ) async {
    emit(const DayLoadingState());
    try{
      DeleteDay uc = DeleteDay(DayRepositoryImpl(DayRemoteDataSourceImpl()));
      var response = await uc(event.day);
      if(response is Right){
        Day day = (response as Right).value;
        print(day.toString());
        emit(DayLoadedState(day: day));
      }else{
        emit(const DayErrorState());
      }
    }catch (e){
      print(e.toString());
      emit(const DayErrorState());
    }
  }
}
