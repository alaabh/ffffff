import '../views/pages/Panier.dart';

class Article {
  final String nom;
  final double prix;
  final int quantity;
  final String imageUrl;
  final String description;

  Article({
    required this.nom,
    required this.prix,
    required this.quantity,
    required this.description,
    required this.imageUrl,
  });
}
 