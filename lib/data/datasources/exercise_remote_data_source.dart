import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_workout/core/util/base_client.dart';

abstract class ExerciseRemoteDataSource{
  Future<Response> createExercise(String dayHash, String nome, String series, String repeticoes, String jwt);
}

class ExerciseRemoteDataSourceImpl extends BaseClient implements ExerciseRemoteDataSource{
  ExerciseRemoteDataSourceImpl() : super(wsEndpoint: 'exercise'){
    String host = '';
    if (kIsWeb) {
      String host = 'localhost';
    } else {
      host = '10.0.3.2';
      changeServiceConnection(false, host, '8081');
    }
  }

  @override
  Future<Response> createExercise(String dayHash, String nome, String series, String repeticoes, String jwt) {
    return post(
        '${wsURL}create',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
        body: {'nome': nome, 'series': series, 'repeticoes': repeticoes, 'agendaHash': dayHash}
    );
  }
}