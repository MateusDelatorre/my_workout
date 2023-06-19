import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/exercise.dart';

abstract class ExerciseRepository{
  Future<Either<Failure, Exercise>> createExercise(String dayHash, String nome, String series, String repeticoes);
}