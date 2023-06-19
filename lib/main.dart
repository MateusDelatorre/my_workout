import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/authentication/view/sign_in/sign_in_page.dart';
import 'package:my_workout/presentation/authentication/view/sign_up/sign_up_page.dart';
import 'package:my_workout/presentation/main_page.dart';
import 'package:my_workout/presentation/workout/workout_list/view/workout_list_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthenticationBloc _authenticator = AuthenticationBloc();


  @override
  void dispose() {
    _authenticator.close();
  } // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => BlocProvider.value(
          value: _authenticator,
          child: const MainPage(),
        ),
        '/SignIn': (context) => BlocProvider.value(
            value: _authenticator,
            child: const SignInPage(),
        ),
        '/SignUp': (context) => BlocProvider.value(
            value: _authenticator,
            child: const SignUpPage(),
        ),
        '/myWorkouts': (context) => BlocProvider.value(
            value: _authenticator,
            child: const WorkoutListPage(),
        ),
      },
    );
  }
}