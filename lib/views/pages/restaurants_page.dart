import 'package:flutter/material.dart';

class RestaurantsPage extends StatefulWidget {
  @override
  _RestaurantsPageState createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Chez Thon',
      location: 'Paris, France',
      rating: 4.5,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Restaurant(
      name: 'Kids Corner',
      location: 'London, UK',
      rating: 4.2,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Restaurant(
      name: 'Pizza Place',
      location: 'New York, USA',
      rating: 4.8,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
    Restaurant(
      name: 'Salad Bar',
      location: 'Los Angeles, USA',
      rating: 4.1,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
    ),
  ];

  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final secondaryColor = Theme.of(context).secondaryHeaderColor;

    final filteredRestaurants = _restaurants.where((restaurant) {
      return restaurant.name.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurants Ouverts'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.search, color: Colors.grey[600]),
                  onPressed: () {
                    // Trigger search functionality here if needed
                  },
                ),
                Expanded(
                  child: TextField(
                    onChanged: (query) {
                      setState(() {
                        _searchQuery = query;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Rechercher...',
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        padding: const EdgeInsets.all(8.0),
        itemCount: filteredRestaurants.length,
        itemBuilder: (context, index) {
          return RestaurantItem(
            restaurant: filteredRestaurants[index],
            borderColor: secondaryColor,
          );
        },
      ),
    );
  }
}

class Restaurant {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;

  Restaurant({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });
}

class RestaurantItem extends StatelessWidget {
  final Restaurant restaurant;
  final Color borderColor;

  const RestaurantItem({Key? key, required this.restaurant, required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('/restaurant');
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
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover,
                      // Use errorBuilder for fallback
                      onError: (error, stackTrace) {
                        // Handle image loading error
                      },
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
                      restaurant.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                        SizedBox(width: 4),
                        Text(
                          restaurant.location,
                          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.star, color: Colors.yellow[700]),
                        SizedBox(width: 4),
                        Text(restaurant.rating.toStringAsFixed(1)),
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

class ModifierRestaurant extends StatelessWidget {
  final Restaurant restaurant;

  const ModifierRestaurant({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier le Restaurant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nom du Restaurant: ${restaurant.name}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, size: 20),
                SizedBox(width: 8),
                Text(
                  'Localisation: ${restaurant.location}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.star, color: Colors.yellow[700], size: 20),
                SizedBox(width: 8),
                Text(
                  'Note: ${restaurant.rating.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
