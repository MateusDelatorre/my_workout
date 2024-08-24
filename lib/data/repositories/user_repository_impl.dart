import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_workout/core/error/error.dart';
import 'package:my_workout/core/util/local_storage.dart';
import 'package:my_workout/data/datasources/remote/user_remote_data_source.dart';
import 'package:my_workout/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository{
  UserRemoteDataSource dataSource;

  UserRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, String>> createUser(String username, String email, String password) async {
    try{
      var response = await dataSource.createUser(username, email, password);
      print("Create user");
      print('code: ${response.statusCode}');
      print('body: ${response.data}');
      if(response.statusCode == 200 || response.statusCode == 201){
        return logIn(email, password);
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
  Future<Either<Failure, String>> logIn(String email, String password) async {
    var response = await dataSource.authenticate(email, password);
    print("Autenticate  ");
    print('code: ${response.statusCode}');
    print('body: ${response.data}');
    if(response.statusCode == 200 || response.statusCode == 201 || response.statusCode == 202){
      Map<String, dynamic> json = jsonDecode(response.data);
      LocalStorage().getData(json);
      LocalStorage.saveToken(LocalStorage.token);
      return Right(LocalStorage.token);
    }else{
      return Left(Failure());
    }
  }

  @override
  logOut() {
    LocalStorage.clearStorage();
  }

}