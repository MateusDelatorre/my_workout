import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/core/util/local_storage.dart';
import 'package:my_workout/data/datasources/remote/workout_remote_data_source.dart';
import 'package:my_workout/data/models/workout_model.dart';
import 'package:my_workout/domain/entities/workout.dart';
import 'package:my_workout/domain/repositories/workout_repository.dart';

class WorkoutRepositoryImpl implements WorkoutRepository{

  final WorkoutRemoteDataSource dataSource;

  WorkoutRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Workout>> createWorkout(String nome) async {
    try{
      Response response = await dataSource.createWorkout(nome, LocalStorage.token);
      print("create Workout");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202){
        return Right(WorkoutModel.fromJsonList(jsonDecode(response.data)));
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

  @override
  Future<Either<Failure, bool>> deleteWorkout(String hash) async {
    try{
      Response response = await dataSource.deleteWorkout(hash, LocalStorage.token);
      print("delete Workout");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      return response.statusCode == 200 ? const Right(true) : Left(Failure());
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

  @override
  Future<Either<Failure, Workout>> getWorkout(String hash) async {
    try{
      Response response = await dataSource.getWorkout(hash, LocalStorage.token);
      print("get Workout");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 202){
        return Right(WorkoutModel.fromJson(jsonDecode(response.data)));
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

  @override
  Future<Either<Failure, List<Workout>>> getWorkouts() async {
    try{
      Response response = await dataSource.getWorkoutList(LocalStorage.token);
      print("get Workout List");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 202){
        List<Workout> wList = [];
        var json = jsonDecode(response.data);
        //print(json[0]);
        for(var wJson in json){
          wList.add(WorkoutModel.fromJsonList(wJson));
        }
        return Right(wList);
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