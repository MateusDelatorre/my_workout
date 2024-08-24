import 'package:my_workout/data/models/exercise_model.dart';
import 'package:my_workout/domain/entities/day.dart';

class DayModel extends Day{
  DayModel({required super.hash, required super.day, required super.exercises});

  factory DayModel.fromJson(Map<String, dynamic> json){
    return DayModel(
      hash: json['hash'],
      day: json['ordem'],
      exercises: ExerciseModel.exercisesFromJson(json),
    );
  }

  static List<Day> daysFromJson(Map<String, dynamic> json){
    List<Day> days = [];
    for(var day in json['agendas']){
      days.add(DayModel.fromJson(day));
    }
    return days;
  }

  static Map<String, dynamic> daysToMap(List<Day> days){
    List<Map<String, dynamic>> daysMap = [];
    for(var day in days){
      daysMap.add(dayToMap(day));
    }
    return {'agendas': daysMap};
  }

  static Map<String, dynamic> dayToMap(Day day) {
    return {
      'hash': day.hash,
      'ordem': day.day,
      'exercicios': ExerciseModel.exercisesToMap(day.exercises),
    };
  }
}