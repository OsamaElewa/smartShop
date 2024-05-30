import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/config/local/cache_helper.dart';

import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(LoginChangeVisibilityState());
  }

  void userrLogin({
    required String email,
    required String password,
  }){
    emit(LoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
    ).then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      CacheHelper.saveData(key: 'userId', value: value.user!.uid);
      emit(LoginSuccessState(
        value.user!.uid
      ));
    }).catchError((error){
      emit(LoginFailureState(
        error.toString(),
      ));
    });
  }
}