part of 'resturant_cubit.dart';

@immutable
sealed class ResturantState {}

final class ResturantInitial extends ResturantState {}
class RestaurantLoading extends ResturantState {}

class RestaurantLoaded extends ResturantState {
  final List<Map<String, dynamic>> restaurants;
  RestaurantLoaded(this.restaurants);
}

class RestaurantError extends ResturantState {
  final String message;
  RestaurantError(this.message);
}
class RestaurantDetailLoading extends ResturantState {}

class RestaurantDetailLoaded extends ResturantState {
  final Map<String, dynamic> restaurant;
  RestaurantDetailLoaded(this.restaurant);
}

class RestaurantDetailError extends ResturantState {
  final String message;
  RestaurantDetailError(this.message);
}