import 'package:my_workout/domain/entities/exercise.dart';

class ExerciseModel extends Exercise{
  ExerciseModel({
    required super.hash,
    required super.name,
    required super.repetitions,
    required super.series
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json){
    return ExerciseModel(
        hash: json['hash'],
        name: json['nome'],
        repetitions: json['repeticoes'],
        series: json['series']
    );
  }

  static List<Exercise> exercisesFromJson(Map<String, dynamic> json){
    List<Exercise> exercises = [];
    try{
      for(var exercise in json['exercises']){
        exercises.add(ExerciseModel.fromJson(exercise));
      }
    }catch (e){
      //print(e.runtimeType);
      return exercises;
    }
    return exercises;
  }
}