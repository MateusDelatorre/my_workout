import 'package:my_workout/domain/entities/day.dart';

class Workout{
  final String hash;
  String name;
  late List<Day> days;


  Workout({
    required this.hash,
    required this.name,
    required this.days
  });

  Workout.forList({
    required this.hash,
    required this.name,
  });
}