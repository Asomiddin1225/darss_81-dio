import 'package:darss_80/model/product.dart';
import 'package:darss_80/repositories/product_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_event.dart';
part 'product_state.dart';

/// `ProductBloc` - Bu sinf mahsulotlar bilan bog'liq barcha holatlar va hodisalarni boshqaradi.
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  /// `ProductBloc` constructor - Bu yerda `ProductRepository` obyektini qabul qiladi
  /// va dastlabki holatni `ProductInitial` holatiga o'rnatadi.
  ProductBloc(this.repository) : super(ProductInitial()) {
    /// `on<FetchProducts>` - Bu yerda mahsulotlarni olish hodisasi boshqariladi.
    /// `emit` yordamida holatlar yangilanadi.
    on<FetchProducts>((event, emit) async {
      emit(
          ProductLoading()); // Mahsulotlarni yuklash jarayonini bildiruvchi holat.
      try {
        final products = await repository
            .fetchProducts(); // Mahsulotlarni repository orqali olish.
        emit(ProductLoaded(
            products)); // Mahsulotlar muvaffaqiyatli yuklanganligini bildiruvchi holat.
      } catch (e) {
        emit(ProductError(
            "Failed to fetch products")); // Mahsulotlarni yuklashda xatolik yuz bersa, xato holatini ko'rsatish.
      }
    });

    /// `on<AddProduct>` - Bu yerda mahsulot qo'shish hodisasi boshqariladi.
    on<AddProduct>((event, emit) async {
      try {
        await repository.addProduct(
            event.product); // Yangi mahsulotni repository orqali qo'shish.
        add(FetchProducts()); // Mahsulot qo'shilgandan so'ng, mahsulotlar ro'yxatini qayta yuklash.
      } catch (e) {
        emit(ProductError(
            "Failed to add product")); // Mahsulot qo'shishda xatolik yuz bersa, xato holatini ko'rsatish.
      }
    });

    /// `on<UpdateProduct>` - Bu yerda mahsulotni yangilash hodisasi boshqariladi.
    on<UpdateProduct>((event, emit) async {
      try {
        await repository.updateProduct(event.id,
            event.product); // Mavjud mahsulotni repository orqali yangilash.
        add(FetchProducts()); // Mahsulot yangilangandan so'ng, mahsulotlar ro'yxatini qayta yuklash.
      } catch (e) {
        emit(ProductError(
            "Failed to update product")); // Mahsulot yangilashda xatolik yuz bersa, xato holatini ko'rsatish.
      }
    });

    /// `on<DeleteProduct>` - Bu yerda mahsulotni o'chirish hodisasi boshqariladi.
    on<DeleteProduct>((event, emit) async {
      try {
        await repository.deleteProduct(
            event.id); // Mavjud mahsulotni repository orqali o'chirish.
        add(FetchProducts()); // Mahsulot o'chirilgandan so'ng, mahsulotlar ro'yxatini qayta yuklash.
      } catch (e) {
        emit(ProductError(
            "Failed to delete product")); // Mahsulot o'chirishda xatolik yuz bersa, xato holatini ko'rsatish.
      }
    });
  }
}
