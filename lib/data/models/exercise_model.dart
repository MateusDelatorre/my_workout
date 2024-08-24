import 'package:my_workout/domain/entities/exercise.dart';

class ExerciseModel extends Exercise{
  ExerciseModel({
    required super.hash,
    required super.name,
    required super.repetitions,
    required super.sets
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json){
    return ExerciseModel(
        hash: json['hash'],
        name: json['nome'],
        repetitions: json['repeticoes'],
        sets: json['series']
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

  static Map<String, dynamic> exercisesToMap(List<Exercise> exercises){
    List<Map<String, dynamic>> exercisesMap = [];
    for(var exercise in exercises){
      exercisesMap.add(exerciseToMap(exercise));
    }
    return {'exercises': exercisesMap};
  }

  static Map<String, dynamic> exerciseToMap(Exercise exercise) {
    return {
      'hash': exercise.hash,
      'nome': exercise.name,
      'repeticoes': exercise.repetitions,
      'series': exercise.sets,
    };
  }
}