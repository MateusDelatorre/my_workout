import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/exercise.dart';

abstract class ExerciseRepository{
  Future<Either<Failure, Exercise>> createExercise(String dayHash, String nome, String sets, String repetition);
  Future<Either<Failure, Exercise>> DeleteExercise(String dayHash, String exerciseHash);
  Future<Either<Failure, Exercise>> updateExercise(String dayHash, String exerciseHash, String nome, String sets, String repetition);
}