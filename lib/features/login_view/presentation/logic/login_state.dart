abstract class LoginState {}

class LoginInitialState extends LoginState {}
class LoginChangeVisibilityState extends LoginState {}

class LoginLoadingState extends LoginState{}
class LoginSuccessState extends LoginState{
  final String uId;
  LoginSuccessState(this.uId);
}
class LoginFailureState extends LoginState{
  final String error;
  LoginFailureState(this.error);
}
