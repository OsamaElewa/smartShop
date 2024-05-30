abstract class RegisterState{}
class RegisterInitialState extends RegisterState{}
class RegisterChangeVisibilityState extends RegisterState{}
class RegisterImageState extends RegisterState{}
class RegisterCreateUserSuccessState extends RegisterState{
  final String uId;
  RegisterCreateUserSuccessState(this.uId);
}
class RegisterCreateUserErrorState extends RegisterState{
  final String error;
  RegisterCreateUserErrorState(this.error);
}

class RegisterLoadingState extends RegisterState{}
class RegisterSuccessState extends RegisterState{}
class RegisterErrorState extends RegisterState{
  final String error;
  RegisterErrorState(this.error);
}