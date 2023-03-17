// ignore_for_file: public_member_api_docs, sort_constructors_first
class SignInState {
  final String usernameErrorText;
  final String passwordErrorText;
  final bool isUsernameValid;
  final bool isPasswordValid;
  final bool isFormSubmitted;
  final bool isFormSubmitting;
  
  SignInState({
     this.usernameErrorText = "",
     this.passwordErrorText = "",
     this.isUsernameValid = true,
     this.isPasswordValid = true,
     this.isFormSubmitted = false,
     this.isFormSubmitting = false,
  });

  SignInState copyWith({
    String? usernameErrorText,
    String? passwordErrorText,
    bool? isUsernameValid,
    bool? isPasswordValid,
    bool? isFormSubmitted,
    bool? isFormSubmitting,
  }) {
    return SignInState(
      usernameErrorText: usernameErrorText ?? this.usernameErrorText,
      passwordErrorText: passwordErrorText ?? this.passwordErrorText,
      isUsernameValid: isUsernameValid ?? this.isUsernameValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isFormSubmitted: isFormSubmitted ?? this.isFormSubmitted,
      isFormSubmitting: isFormSubmitting ?? this.isFormSubmitting,
    );
  }
}