import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  ArticleCubit() : super(ArticleInitial());

  Future<void> fetchSpecialToday() async {
    try {
      emit(ArticleLoading());

      // Query articles where today_special is true
      QuerySnapshot querySnapshot = await _firestore
          .collection('article')
          .where('today_special', isEqualTo: true)
          .get();

      // Include document ID with the data
      List<Map<String, dynamic>> articles = querySnapshot.docs
          .map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            data['id'] = doc.id; // Add the document ID to the map
            return data;
          })
          .toList();

      print(articles);

      emit(ArticleLoaded(articles));
    } catch (e) {
      print(e);

      emit(ArticleError('Failed to load articles: ${e.toString()}'));
    }
  }
}
