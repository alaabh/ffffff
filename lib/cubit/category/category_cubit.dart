import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CategoryCubit() : super(CategoryInitial());
  Future<void> fetchCategorys() async {
    try {
      emit(CategoryLoading());

      QuerySnapshot querySnapshot =
          await _firestore.collection('category').get();

      List<Map<String, dynamic>> categorys = querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
      print(categorys);

      emit(CategoryLoaded(categorys));
    } catch (e) {
      print(e);

      emit(CategoryError('Failed to load categorys: ${e.toString()}'));
    }
  }
}
