import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/data/datasources/remote/workout_remote_data_source.dart';
import 'package:my_workout/data/repositories/workout_repository_impl.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

part 'workout_list_state.dart';

class WorkoutListCubit extends Cubit<WorkoutListState> {
  WorkoutListCubit() : super(WorkoutListInitial()){
    getWorkoutList();
  }

  final WorkoutRepository repository = WorkoutRepositoryImpl(WorkoutRemoteDataSourceImpl());

  void getWorkoutList() async {
    try {
      emit(LoadingState());
      var response = await repository.getWorkouts();
      if(response is Right){
        List<Workout> wList = (response as Right).value;
        print(wList);
        emit(LoadedState(wList));
      }else{
        emit(ErrorState());
      }
    } catch (e) {
      print(e.toString());
      emit(ErrorState());
    }
  }
}
