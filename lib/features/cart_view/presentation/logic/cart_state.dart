abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}
class CartSuccessState extends CartState {}
class CartErrorState extends CartState {
  final String error;
  CartErrorState(this.error);
}

class AddToCartSuccessStates extends CartState{}
class ProductExistStates extends CartState{}
class AddToCartErrorStates extends CartState{
  final String error;
  AddToCartErrorStates(this.error);
}