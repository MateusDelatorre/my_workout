import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_workout/core/util/base_client.dart';

abstract class WorkoutRemoteDataSource{
  Future<Response> createWorkout(String nome, String jwt);
  Future<Response> deleteWorkout(String hash, String jwt);
  Future<Response> getWorkout(String hash, String jwt);
  Future<Response> getWorkoutList(String jwt);
}

class WorkoutRemoteDataSourceImpl extends BaseClient implements WorkoutRemoteDataSource{
  WorkoutRemoteDataSourceImpl() : super(wsEndpoint: 'workout'){
    String host = '';
    if (kIsWeb) {
      String host = 'localhost';
    } else {
      host = '10.0.3.2';
      changeServiceConnection(false, host, '8081');
    }
  }

  @override
  Future<Response> createWorkout(String nome, String jwt) {
    return post(
      '${wsURL}create',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
      body: {'nome': nome}
    );
  }

  @override
  Future<Response> deleteWorkout(String hash, String jwt) {
    return delete(
      '$wsURL/delete/$hash',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
    );
  }

  @override
  Future<Response> getWorkout(String hash, String jwt) {
    return get(
      '$wsURL/$hash',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
    );
  }

  @override
  Future<Response> getWorkoutList(String jwt) {
    return get(
      '$wsURL/user/list',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
    );
  }
}