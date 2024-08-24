import 'package:dartz/dartz.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/domain/entities/exercise.dart';
import 'package:my_workout/domain/repositories/exercise_repository.dart';

class ExerciseUseCases{
  final ExerciseRepository _exerciseRepository;

  ExerciseUseCases(this._exerciseRepository);

  Future<Either<Failure, Exercise>> createExercise(String dayHash, String nome, String sets, String repetition){
    return _exerciseRepository.createExercise(dayHash, nome, sets, repetition);

  }
  Future<Either<Failure, Exercise>> DeleteExercise(String dayHash, String exerciseHash){
    return _exerciseRepository.DeleteExercise(dayHash, exerciseHash);
  }
  Future<Either<Failure, Exercise>> updateExercise(String dayHash, String exerciseHash, String nome, String sets, String repetition){
    return _exerciseRepository.updateExercise(dayHash, exerciseHash, nome, sets, repetition);
  }
}