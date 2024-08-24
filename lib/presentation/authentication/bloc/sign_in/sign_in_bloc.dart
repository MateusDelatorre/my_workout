import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/core/util/form_validator.dart';
import 'package:my_workout/data/datasources/remote/user_remote_data_source.dart';
import 'package:my_workout/data/repositories/user_repository_impl.dart';
import 'package:my_workout/domain/usecases/user/log_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInEmailChanged>(_onEmailChanged);
    on<SignInPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignIn);
    on<GoToSignUpEvent>(_onGoToSignUp);
  }

  void _onGoToSignUp(
      GoToSignUpEvent event,
      Emitter<SignInState> emit,
      ) {
    emit(GoToSignUp());
  }

  void _onEmailChanged(
      SignInEmailChanged event,
      Emitter<SignInState> emit,
      ){
    final email = event.email;
    emit(
      state.copyWith(
        email: email,
        isValid: FormValidator.validate(email: email, password: state.password),
      ),
    );
  }

  void _onPasswordChanged(
      SignInPasswordChanged event,
      Emitter<SignInState> emit,
      ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        isValid: FormValidator.validate(email: state.email,password: password,),
      ),
    );
  }

  Future<void> _onSignIn(
      SignInSubmitted event,
      Emitter<SignInState> emit,
      ) async {
    if (state.isValid) {
      //emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        LoginIn uc = LoginIn(UserRepositoryImpl(UserRemoteDataSourceImpl()));
        await uc(
          state.email,
          state.password,
        );
        emit(Finished());
        //emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        print(e.toString());
        //emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
