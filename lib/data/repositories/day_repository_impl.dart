import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/core/util/local_storage.dart';
import 'package:my_workout/data/datasources/day_remote_data_source.dart';
import 'package:my_workout/data/models/day_model.dart';
import 'package:my_workout/domain/entities/day.dart';
import 'package:my_workout/domain/repositories/day_repository.dart';

class DayRepositoryImpl implements DayRepository{

  final DayRemoteDataSource dataSource;

  DayRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Day>> createDay(int ordem, String workoutHash) async {
    try{
      Response response = await dataSource.createDay(ordem.toString(), workoutHash, LocalStorage.token);
      print("Create day");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 201){
        return Right(DayModel.fromJson(jsonDecode(response.data)));
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
  Future<Either<Failure, bool>> deleteDay(String hash) async {
    try{
      Response response = await dataSource.deleteDay(hash, LocalStorage.token);
      print("Delete day");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202){
        return const Right(true);
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
  Future<Either<Failure, bool>> updateDay(String hash, int ordem) async {
    try{
      Response response = await dataSource.updateDay(hash, ordem.toString(), LocalStorage.token);
      print("Update day");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202){
        return const Right(true);
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