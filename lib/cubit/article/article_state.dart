part of 'article_cubit.dart';

@immutable
sealed class ArticleState {}

final class ArticleInitial extends ArticleState {}
class ArticleLoading extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<Map<String, dynamic>> articles;
  ArticleLoaded(this.articles);
}

class ArticleError extends ArticleState {
  final String message;
  ArticleError(this.message);
}