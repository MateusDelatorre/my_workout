import 'package:my_workout/domain/entities/day.dart';

class Workout{
  final String hash;
  String name;
  List<Day> days;


  Workout({
    required this.hash,
    required this.name,
    required this.days
  });
}