abstract class SigninEvents{}

class UsernameChanged extends SigninEvents{
  String username;
  UsernameChanged(this.username);
}
class PasswordChanged extends SigninEvents{
  String password;
  PasswordChanged(this.password);
}
class SignInSubmitting extends SigninEvents{}
class SignInSubmitted extends SigninEvents{}