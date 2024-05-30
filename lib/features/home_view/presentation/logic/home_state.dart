abstract class HomeState {}
class HomeInitialState extends HomeState {}

class SearchClearState extends HomeState{}
class SearchChangedState extends HomeState{}
class GetProductsLoadingStates extends HomeState{}
class GetProductsSuccessStates extends HomeState{}

class AddToCartSuccessStates extends HomeState{}
class ProductExistStates extends HomeState{}
class AddToCartErrorStates extends HomeState{
  final String error;
  AddToCartErrorStates(this.error);
}

class CartLoadingState extends HomeState {}
class CartSuccessState extends HomeState {}
class RemoveItemFromCartState extends HomeState {}
class RemoveAllCartState extends HomeState {}
class UpdateQuantityCartState extends HomeState {}
class CartErrorState extends HomeState {
  final String error;
  CartErrorState(this.error);
}
class GetProductsErrorStates extends HomeState{
  final String error;
  GetProductsErrorStates(this.error);
}