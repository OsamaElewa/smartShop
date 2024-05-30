import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/profile_view/presentation/logic/profile_state.dart';

import '../../../../config/local/cache_helper.dart';
import '../../../login_view/data/user_model.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitialState());

  static ProfileCubit get(context) => BlocProvider.of(context);


  UserModel? userModel;
  void getUser() {
    emit(ProfileLoadingState());
    FirebaseFirestore.instance.collection('Users').doc(CacheHelper.getData(key: 'uId')).get().then((value) {
      userModel = UserModel.fromJson(value.data()!);
      print(value.data());
      emit(ProfileSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ProfileErrorState(error.toString()));
    });
  }
}