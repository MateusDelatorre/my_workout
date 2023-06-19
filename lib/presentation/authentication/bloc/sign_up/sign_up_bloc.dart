import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_workout/core/util/form_validator.dart';
import 'package:my_workout/data/datasources/user_remote_data_source.dart';
import 'package:my_workout/data/repositories/user_repository_impl.dart';
import 'package:my_workout/domain/usecases/user/create_user.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpInitial()) {
    on<SignUpUsernameChanged>(_onUsernameChanged);
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpSubmitted>(_onSignUp);
    on<GoToSignInEvent>(_onGoToSignIn);
  }

  void _onGoToSignIn(
      GoToSignInEvent event,
      Emitter<SignUpState> emit,
      ) {
    emit(const GoToSignIn());
  }

  void _onUsernameChanged(
      SignUpUsernameChanged event,
      Emitter<SignUpState> emit,
      ) {
    String username = event.username;
    emit(
      state.copyWith(username: username),
    );
  }

  void _onEmailChanged(
      SignUpEmailChanged event,
      Emitter<SignUpState> emit,
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
      SignUpPasswordChanged event,
      Emitter<SignUpState> emit,
      ) {
    final password = event.password;
    emit(
      state.copyWith(
        password: password,
        isValid: FormValidator.validate(email: state.email,password: password,),
      ),
    );
  }

  Future<void> _onSignUp(
      SignUpSubmitted event,
      Emitter<SignUpState> emit,
      ) async {
    if (state.isValid) {
      //emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        print('teste');
        CreateUser uc = CreateUser(UserRepositoryImpl(UserRemoteDataSourceImpl()));
        print('teste2');
        await uc(
          state.username,
          state.email,
          state.password,
        );
        print('teste2');
        emit(Loged());
        //emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (e) {
        print(e.toString());
        //emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
