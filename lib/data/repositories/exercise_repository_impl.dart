import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/core/util/local_storage.dart';
import 'package:my_workout/data/datasources/exercise_remote_data_source.dart';
import 'package:my_workout/data/models/exercise_model.dart';
import 'package:my_workout/domain/entities/exercise.dart';
import 'package:my_workout/domain/repositories/exercise_repository.dart';

class ExerciseRepositoryImpl implements ExerciseRepository{

  final ExerciseRemoteDataSource dataSource;

  ExerciseRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Exercise>> createExercise(String dayHash, String nome, String series, String repeticoes) async {
    try{
      Response response = await dataSource.createExercise(dayHash, nome, series, repeticoes, LocalStorage.token);
      print("Create exercise");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 201){
        return Right(ExerciseModel.fromJson(jsonDecode(response.data)));
      }else{
        return Left(Failure());
      }
    } on SocketException catch (e) {
      /// No Internet connection
      print(e.toString());
      return Left(Failure());
    } on TimeoutException catch (e) {
      print(e.toString());
      return Left(Failure());
    } on DioError catch(e){
      print(e.toString());
      return Left(Failure());
    } catch(e) {
      print(e.toString());
      return Left(Failure());
    }
  }
}