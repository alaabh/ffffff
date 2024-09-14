import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'resturant_state.dart';

class ResturantCubit extends Cubit<ResturantState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ResturantCubit() : super(ResturantInitial());
  Future<void> fetchRestaurants() async {
    try {
      emit(RestaurantLoading());

      QuerySnapshot querySnapshot =
          await _firestore.collection('restaurant').limit(6).get();

      List<Map<String, dynamic>> restaurants = querySnapshot.docs.map((doc) {
        return {'id': doc.id, ...doc.data() as Map<String, dynamic>};
      }).toList();

      print(restaurants);

      emit(RestaurantLoaded(restaurants));
    } catch (e) {
      print(e);

      emit(RestaurantError('Failed to load restaurants: ${e.toString()}'));
    }
  }



   Future<void> fetchRestaurantById(String restaurantId) async {
    try {
      emit(RestaurantDetailLoading());

      DocumentSnapshot docSnapshot = await _firestore
          .collection('restaurant')
          .doc(restaurantId)
          .get();

      if (docSnapshot.exists) {
        final restaurant = {
          'id': docSnapshot.id,
          ...docSnapshot.data() as Map<String, dynamic>
        };
        emit(RestaurantDetailLoaded(restaurant));
      } else {
        emit(RestaurantDetailError('Restaurant not found'));
      }
    } catch (e) {
      emit(RestaurantDetailError('Failed to load restaurant: ${e.toString()}'));
    }
  }
}
