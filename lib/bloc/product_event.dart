part of 'product_bloc.dart';

/// ProductEvent - Bu abstrakt klass bo'lib, barcha mahsulot hodisalari uchun asosiy klass hisoblanadi.
abstract class ProductEvent {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

/// FetchProducts - Mahsulotlarni olish hodisasi.
/// Bu hodisa mahsulotlarni yuklash uchun ishlatiladi.
class FetchProducts extends ProductEvent {}

/// AddProduct - Mahsulot qo'shish hodisasi.
/// Bu hodisa yangi mahsulot qo'shish uchun ishlatiladi.
class AddProduct extends ProductEvent {
  final Product product;

  /// Constructor - qo'shilayotgan mahsulotni qabul qiladi.
  AddProduct(this.product);

  @override
  List<Object> get props => [product];
}

/// UpdateProduct - Mahsulotni yangilash hodisasi.
/// Bu hodisa mavjud mahsulotni yangilash uchun ishlatiladi.
class UpdateProduct extends ProductEvent {
  final int id;
  final Product product;

  /// Constructor - yangilanayotgan mahsulotning ID'sini va yangi ma'lumotlarni qabul qiladi.
  UpdateProduct(this.id, this.product);

  @override
  List<Object> get props => [id, product];
}

/// DeleteProduct - Mahsulotni o'chirish hodisasi.
/// Bu hodisa mavjud mahsulotni o'chirish uchun ishlatiladi.
class DeleteProduct extends ProductEvent {
  final int id;

  /// Constructor - o'chirilayotgan mahsulotning ID'sini qabul qiladi.
  DeleteProduct(this.id);

  @override
  List<Object> get props => [id];
}
