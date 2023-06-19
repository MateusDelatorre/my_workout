import 'package:my_workout/data/models/day_model.dart';
import 'package:my_workout/domain/entities/workout.dart';

class WorkoutModel extends Workout{
  WorkoutModel({required super.hash, required super.name, required super.days});
  WorkoutModel.forList({required hash, required name}) : super.forList(hash: hash, name: name);

  factory WorkoutModel.fromJson(Map<String, dynamic> json){
    return WorkoutModel(
        hash: json['hash'],
        name: json['nome'],
        days: DayModel.daysFromJson(json)
    );
  }

  factory WorkoutModel.fromJsonList(Map<String, dynamic> json){
    return WorkoutModel.forList(
        hash: json['hash'],
        name: json['nome'],
    );
  }
}