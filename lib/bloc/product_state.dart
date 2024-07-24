part of 'product_bloc.dart';

/// ProductState - Bu abstrakt klass bo'lib, barcha mahsulot holatlari uchun asosiy klass hisoblanadi.
abstract class ProductState {
  const ProductState();

  @override
  List<Object> get props => [];
}

/// ProductInitial - Dastlabki holat. Mahsulotlar holati boshlang'ich holatda ekanligini bildiradi.
class ProductInitial extends ProductState {}

/// ProductLoading - Yuklash holati. Mahsulotlar yuklanayotgani jarayonini bildiradi.
class ProductLoading extends ProductState {}

/// ProductLoaded - Yuklangan holat. Mahsulotlar muvaffaqiyatli yuklanib bo'lgach, bu holat faollashadi.
/// Bu holat yuklangan mahsulotlar ro'yxatini saqlaydi.
class ProductLoaded extends ProductState {
  final List<Product> products;

  /// Constructor - mahsulotlar ro'yxatini qabul qiladi.
  ProductLoaded(this.products);

  @override
  List<Object> get props => [products];
}

/// ProductError - Xato holati. Mahsulotlarni yuklashda xato yuz berganini bildiradi.
/// Bu holat xato haqida xabarni saqlaydi.
class ProductError extends ProductState {
  final String message;

  /// Constructor - xato xabarini qabul qiladi.
  ProductError(this.message);

  @override
  List<Object> get props => [message];
}
