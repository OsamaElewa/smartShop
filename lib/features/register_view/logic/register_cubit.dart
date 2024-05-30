import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_shop/features/register_view/logic/register_state.dart';

import '../../../config/local/cache_helper.dart';
import '../../login_view/data/user_model.dart';

class RegisterCubit extends Cubit<RegisterState>{
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    emit(RegisterChangeVisibilityState());
  }

  // var selected=File(CacheHelper.getData(key: 'deviceImage'));
  // File imageData=selected;
  File? imageData;
  Future<void> getCameraImage()async{
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.camera);
    if(image!=null){
      var selected=File(image.path);
      CacheHelper.saveData(key: 'profileImage', value: image.path);
      imageData=selected;
      emit(RegisterImageState());
      print(imageData!.path);
      print(imageData!.absolute);
      print(imageData!);
      print('yes');
    }else{
      print('No');
    }
  }

  Future<void> getGalleryImage()async{
    final ImagePicker picker=ImagePicker();
    XFile? image =await picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      var selected=File(image.path);
      CacheHelper.saveData(key: 'profileImage', value: image.path);
      emit(RegisterImageState());
      imageData=selected;
      print(imageData!.path);
      print(imageData!.absolute);
      print(imageData!);
      print('yes');
    }else{
      print('No');
    }
  }


  void registerData(
      ) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    )
        .then((value) {
      print(value.user?.email);
      print(value.user?.uid);
      userCreate(
        name: userNameController.text,
        email: emailController.text,
        uId: value.user!.uid,
        password: passwordController.text,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String name,
    required String email,
    required String password,
    required String uId,
  }) {
    UserModel model = UserModel(
        userId: uId,
        userName: name,
        userImage: '',
        userEmail: email,
        createdAt: Timestamp.now(),
        userCart: [],
        userWishList: [],
        userPassword: password
    );

    FirebaseFirestore.instance
        .collection('Users')
        .doc(uId)
        .set(model.toMap())
        .then((value) {
      emit(RegisterCreateUserSuccessState(
        uId
      ));
    }).catchError((error) {
      emit(RegisterCreateUserErrorState(error.toString()));
    });
  }
}