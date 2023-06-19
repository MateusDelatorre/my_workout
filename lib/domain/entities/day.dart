import 'package:my_workout/domain/entities/exercise.dart';

class Day{
  final String hash;
  final List<Exercise> exercises;
  final int day;

  const Day({
    required this.hash,
    required this.day,
    required this.exercises
  });
}