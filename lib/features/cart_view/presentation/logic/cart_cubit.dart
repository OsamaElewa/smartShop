import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/features/cart_view/presentation/data/models/cart_model.dart';
import 'package:smart_shop/features/home_view/presentation/logic/home_cubit.dart';
import 'package:uuid/uuid.dart';

import '../../../search_view/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

 static CartCubit get(context) => BlocProvider.of(context);



}