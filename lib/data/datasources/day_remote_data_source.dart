import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_workout/core/util/base_client.dart';

abstract class DayRemoteDataSource{
  Future<Response> createDay(String ordem, String workoutHash, String jwt);
  Future<Response> deleteDay(String hash, String jwt);
  Future<Response> updateDay(String hash, String ordem, String jwt);
}

class DayRemoteDataSourceImpl extends BaseClient implements DayRemoteDataSource{
  DayRemoteDataSourceImpl() : super(wsEndpoint: 'agenda'){
    String host = '';
    if (kIsWeb) {
      String host = 'localhost';
    } else {
      host = '10.0.3.2';
      changeServiceConnection(false, host, '8081');
    }
  }

  @override
  Future<Response> createDay(String ordem, String workoutHash, String jwt) {
    return post(
        '${wsURL}create',
        headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
        body: {'ordem': ordem, 'workoutHash': workoutHash}
    );
  }

  @override
  Future<Response> deleteDay(String hash, String jwt) {
    return delete(
      '${wsURL}/delete/$hash',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
    );
  }

  @override
  Future<Response> updateDay(String hash, String ordem, String jwt) {
    return post(
      '${wsURL}/update',
      headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'},
        body: {'hash': hash, 'ordem': ordem}
    );
  }
}