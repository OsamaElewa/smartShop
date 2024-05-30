import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_shop/config/local/cache_helper.dart';
import 'package:smart_shop/core/utils/app_assets.dart';
import 'package:smart_shop/features/layout_view/views/widgets/remove_all_cart.dart';
import 'package:uuid/uuid.dart';

import '../../../cart_view/presentation/data/models/cart_model.dart';
import '../../../search_view/models/product_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  var searchController = TextEditingController();

  List<String> swiperImages = [
    AppAssets.banner1,
    AppAssets.banner2,
  ];

  void clear() {
    searchController.clear();
    emit(SearchClearState());
  }

  void searchChanged() {
    emit(SearchChangedState());
  }

  List<ProductModel> products1 = [];

  Stream<List<ProductModel>> getProducts1() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots().map((snapShot) {
      products1 = [];
      for (var element in snapShot.docs) {
        products1.add(ProductModel.fromJson(element.data()));
      }
      return products1;
    });
  }

  Map<String, CartModel> cartList = {};


  void getCart() {
  cartList = {};
  FirebaseFirestore.instance.collection('Users').doc(
  CacheHelper.getData(key: 'userId')).get().then((value) {
  for (int index = 0; index < value.data()!['userCart'].length  ; index++) {
  cartList.putIfAbsent(value.data()!['userCart'][index]['productId'],
  () =>
  CartModel(
  cartId: value.data()!['userCart'][index]['cartId'],
  productId: value.data()!['userCart'][index]['productId'],
  quantity: value.data()!['userCart'][index]['quantity']
  )
  );
  }
  emit(CartSuccessState());
  });
  }

  ProductModel getCartItemById({required String productId}) {
  return products1.firstWhere((element1) => element1.productId == productId);
  }

  void addToCart({
  required String productId,
  }) {
  final cartId = const Uuid().v4();
  if (cartList.containsKey(productId)) {
  emit(ProductExistStates());
  } else {
  FirebaseFirestore.instance.collection('Users')
      .doc(CacheHelper.getData(key: 'userId'))
      .update({
  'userCart': FieldValue.arrayUnion([
  {
  'cartId': cartId,
  'productId': productId,
  'quantity': 1
  }
  ])
  }).then((value) {
  getCart();
  emit(AddToCartSuccessStates());
  }).catchError((error) {
  emit(AddToCartErrorStates(error.toString()));
  }
  );
  }
  }


  void updateQuantity({required String cartId, required String productId, required int quantity}) {
  cartList.update(
  productId,
  (value) =>
  CartModel(
  cartId: cartId,
  productId: productId,
  quantity: quantity
  ));
  removeAllCart();
  addAllCart();
  getCart();
  }
  void removeAllCart(){
  FirebaseFirestore.instance.collection('Users')
      .doc(CacheHelper.getData(key: 'userId'))
      .update({
  'userCart': FieldValue.delete()
  }
  );
  }


  void removeAllCartBar(){
    FirebaseFirestore.instance.collection('Users')
        .doc(CacheHelper.getData(key: 'userId'))
        .update({
      'userCart': FieldValue.delete()
    }
    );
    cartList = {};
    emit(RemoveAllCartState());
  }

  void removeCartItem({required String cartId, required String productId, required int quantity}) {
    FirebaseFirestore.instance.collection('Users')
        .doc(CacheHelper.getData(key: 'userId'))
        .update({
      'userCart': FieldValue.arrayRemove(
          [
            {
              'cartId': cartId,
              'productId': productId,
              'quantity': quantity
            }
          ]
      )
    }
    );
    getCart();
  }

  void addAllCart(){
    var db = FirebaseFirestore.instance.collection('Users')
        .doc(CacheHelper.getData(key: 'userId'));
    for(int index = 0; index < cartList.length; index++){
      db.update(
      {
      'userCart': FieldValue.arrayUnion([
      {
      'cartId': cartList.values.toList()[index].cartId,
      'productId': cartList.values.toList()[index].productId,
      'quantity': cartList.values.toList()[index].quantity
      }
      ])
      }
      );
    }
  }

  int getQuantity() {
  int total = 0;
  cartList.forEach((key, value) {
  total += value.quantity;
  });
  return total;
  }

  double getTotal() {
  double total = 0.0;
  cartList.forEach((key, value) {
  final ProductModel? getCurrentProduct = getCartItemById(
  productId: value.productId);
  if (getCurrentProduct == null) {
  total += 0.0;
  } else {
  total += double.parse(getCurrentProduct.productPrice!) * value.quantity;
  }
  });
  return total;
  }

  void updateCartQuantity({required String productId,required String cartId,required int quantity}) {
  FirebaseFirestore.instance.collection('Users')
      .doc(CacheHelper.getData(key: 'userId'))
      .update({
  'userCart': FieldValue.arrayUnion(
  [
  {
  'cartId': cartId,
  'productId': productId,
  'quantity': quantity
  }
  ]
  )
  }
  );
  getCart();
  }



  void clearCart() {
  cartList.clear();
  emit(RemoveAllCartState());
  }

}