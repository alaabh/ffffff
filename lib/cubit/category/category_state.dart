part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}
class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Map<String, dynamic>> ategorys;
  CategoryLoaded(this.ategorys);
}

class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}