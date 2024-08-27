import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'all_categories.dart'; // Import the existing file

class CategoryCarouselComponent extends StatelessWidget {
  final List<String> categories = ['All', 'Petit Dej', 'Plats', 'Smoothies'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 37,
                  height: 37,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.star,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/categories');
              },
              child: Text(
                'Voir Tous',
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10), 
        CarouselSlider(
          options: CarouselOptions(
            height: 40, 
            initialPage: 0, 
            viewportFraction: 0.3, 
            enableInfiniteScroll: false,
            scrollDirection: Axis.horizontal, 
            reverse: false,
            padEnds: false, 
          ),
          items: categories.map((item) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryDetailPage(categoryTitle: item),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 4), 
              decoration: BoxDecoration(
                color: item == 'All' ? Colors.green : Color.fromARGB(255, 217, 215, 215),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  item,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 14, 
                  ),
                ),
              ),
            ),
          )).toList(),
        ),
      ],
    );
  }
}
