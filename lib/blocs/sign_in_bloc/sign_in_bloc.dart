import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_test_4/blocs/sign_in_bloc/sign_in_events.dart';
import 'package:forms_test_4/blocs/sign_in_bloc/sign_in_states.dart';

class SignInBloc extends Bloc<SigninEvents, SignInState> {
  SignInBloc() : super(SignInState()) {
    
    on<UsernameChanged>((event, emit) {
      if(event.username.isEmpty){
        emit(state.copyWith(usernameErrorText: "Username can't be empty!",isUsernameValid: false));
      }
      else if(event.username.length < 3){
        emit(state.copyWith(usernameErrorText: "Username is too short.",isUsernameValid: false));
      }
      else{
        emit(state.copyWith(isUsernameValid: true));
      }
    });

    on<PasswordChanged>((event, emit) {
      if(event.password.isEmpty){
        emit(state.copyWith(passwordErrorText: "Password can't be empty!",isPasswordValid: false));
      }
      else if(event.password.length < 8){
        emit(state.copyWith(passwordErrorText: "Password is too short.",isPasswordValid: false));
      }
      else{
        emit(state.copyWith(isPasswordValid: true));
      }
    });

    on<SignInSubmitting>((event, emit) {
      emit(state.copyWith(isFormSubmitting: true));
    });

    on<SignInSubmitted>((event, emit) {
      emit(state.copyWith(isFormSubmitting: false,isFormSubmitted: true));
    });  
  }
}