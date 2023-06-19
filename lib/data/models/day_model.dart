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
}