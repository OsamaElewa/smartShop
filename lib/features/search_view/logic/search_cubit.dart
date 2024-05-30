import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/features/search_view/logic/search_state.dart';

import '../models/product_model.dart';
class SearchCubit extends Cubit<SearchState>{
  SearchCubit() : super(SearchInitialState());


  static SearchCubit get(context) => BlocProvider.of(context);




}