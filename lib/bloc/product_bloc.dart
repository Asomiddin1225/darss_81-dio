import 'package:darss_80/model/product.dart';
import 'package:darss_80/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await repository.fetchProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError("Failed to fetch products"));
      }
    });

    on<AddProduct>((event, emit) async {
      try {
        await repository.addProduct(event.product);
        add(FetchProducts()); // Refetch products after adding
      } catch (e) {
        emit(ProductError("Failed to add product"));
      }
    });

    on<UpdateProduct>((event, emit) async {
      try {
        await repository.updateProduct(event.id, event.product);
        add(FetchProducts()); // Refetch products after updating
      } catch (e) {
        emit(ProductError("Failed to update product"));
      }
    });

    on<DeleteProduct>((event, emit) async {
      try {
        await repository.deleteProduct(event.id);
        add(FetchProducts()); // Refetch products after deleting
      } catch (e) {
        emit(ProductError("Failed to delete product"));
      }
    });
  }
}
