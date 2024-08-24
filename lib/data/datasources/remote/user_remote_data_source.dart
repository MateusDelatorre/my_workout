import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:my_workout/core/util/base_client.dart';

abstract class UserRemoteDataSource{
  Future<Response> createUser(String username, String email, String password);
  Future<Response> authenticate(String email, String password);
}

class UserRemoteDataSourceImpl extends BaseClient implements UserRemoteDataSource{
  UserRemoteDataSourceImpl() : super(wsEndpoint: 'user'){
    String host = '';
    if (kIsWeb) {
      String host = 'localhost';
    } else {
      host = '10.0.3.2';
      changeServiceConnection(false, host, '8080');
    }
  }

  @override
  Future<Response> authenticate(String email, String password) {
    print(wsURL);
    return post(
      '$wsURL/authenticate',
        body: {'email': email, 'password': password}
    );
  }

  @override
  Future<Response> createUser(String username, String email, String password) {
    print(wsURL);
    return post(
        '$wsURL/create',
        body: {'username': username, 'email': email, 'password': password}
    );
  }

}