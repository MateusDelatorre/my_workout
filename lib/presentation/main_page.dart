import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_workout/presentation/authentication/bloc/authentication/authentication_bloc.dart';
import 'package:my_workout/presentation/authentication/view/sign_in/sign_in_page.dart';
import 'package:my_workout/presentation/authentication/view/sign_up/sign_up_page.dart';
import 'package:my_workout/presentation/workout/workout_list/view/workout_list_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (_, state) {
          print(state);
          if(state is Authenticated){
            return BlocProvider.value(
              value: context.read<AuthenticationBloc>(),
              child: const WorkoutListPage(),
            );
          }else if(state is AuthenticationSignIn){
            return BlocProvider.value(
              value: context.read<AuthenticationBloc>(),
              child: const SignInPage(),
            );
          }else if(state is AuthenticationSignUp){
            return BlocProvider.value(
              value: context.read<AuthenticationBloc>(),
              child: const SignUpPage(),
            );
          }else{
            return const Center(
              child: Text("Algo de errado não esta certo"),
            );
          }
        }
    );
  }
}
