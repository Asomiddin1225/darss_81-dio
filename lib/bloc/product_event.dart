part of 'product_bloc.dart';

abstract class ProductEvent {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class FetchProducts extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;

  AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

class UpdateProduct extends ProductEvent {
  final int id;
  final Product product;

  UpdateProduct(this.id, this.product);

  @override
  List<Object> get props => [id, product];
}

class DeleteProduct extends ProductEvent {
  final int id;

  DeleteProduct(this.id);

  @override
  List<Object> get props => [id];
}
