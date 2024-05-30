import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_strings.dart';
import '../../cart_view/presentation/views/cart_view.dart';
import '../../home_view/presentation/views/home_view.dart';
import '../../profile_view/presentation/views/profile_view.dart';
import '../../search_view/views/search_view.dart';
import 'layout_state.dart';


class LayoutCubit extends Cubit<LayoutState>{
  LayoutCubit() : super(LayoutInitialState());


  static LayoutCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    const HomeView(),
    const SearchView(),
    const CartView(),
    const ProfileView()
  ];


  List<String> appBarTitles = [
     AppStrings.homeScreenText,
     AppStrings.searchScreenText,
     AppStrings.cartScreenText,
     AppStrings.profileScreenText
  ];

  void changeIndex(int index){
    currentIndex = index;
    emit(LayoutChangeIndexState());
  }
}