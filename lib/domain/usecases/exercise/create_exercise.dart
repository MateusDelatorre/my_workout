import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/exercise.dart';
import 'package:my_workout/domain/repositories/exercise_repository.dart';

class CreateExercise {
  final ExerciseRepository repository;

  CreateExercise(this.repository);

  Future<Either<Failure, Exercise>> call(String dayHash, String name, String series, String repeticoes) {
    return repository.createExercise(dayHash, name, series, repeticoes);
  }
}