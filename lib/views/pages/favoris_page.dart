import 'package:flutter/material.dart';

class FavorisPage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      nom: 'Sandwich Thon',
      price: 10.00,
      restaurantName: 'Chez Thon',
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Article(
      nom: 'Pack Kids',
      price: 15.00,
      restaurantName: 'Kids Corner',
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Article(
      nom: 'Pizza Margherita',
      price: 12.00,
      restaurantName: 'Pizza Place',
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Article(
      nom: 'Caesar Salad',
      price: 8.00,
      restaurantName: 'Salad Bar',
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).secondaryHeaderColor; 
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Favoris'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75, 
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ChartItem(article: articles[index], borderColor: secondaryColor);
        },
      ),
    );
  }
}

class Article {
  final String nom;
  final double price;
  final String restaurantName;
  final String imageUrl;

  Article({
    required this.nom,
    required this.price,
    required this.restaurantName,
    required this.imageUrl,
  });
}

class ChartItem extends StatelessWidget {
  final Article article;
  final Color borderColor;

  const ChartItem({Key? key, required this.article, required this.borderColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          Navigator.of(context).pushNamed('/article');
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: borderColor, width: 2.0), 
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'Supprimer') {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text('Vous êtes sûr de supprimer cet article ?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();  
                                },
                                child: Text('Annuler'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop(); 
                                },
                                child: Text('Oui'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                    itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                      const PopupMenuItem<String>(
                        value: 'Supprimer',
                        child: ListTile(
                          leading: Icon(Icons.delete),
                          title: Text('Supprimer'),
                        ),
                      ),
                    ],
                    icon: Icon(Icons.more_vert),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      article.nom,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      article.restaurantName,
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(article.price.toStringAsFixed(2)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModifierChartArticle extends StatelessWidget {
  final Article article;

  const ModifierChartArticle({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier l\'Article'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom de l\'Article: ${article.nom}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Prix: ${article.price}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
