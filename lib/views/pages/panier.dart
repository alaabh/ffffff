import 'package:flutter/material.dart';
import 'dart:math';
import '../../models/article.dart';
import 'driver_random_search.dart';
import '../../widgets/panier_item.dart';

class ChartPage extends StatelessWidget {
  final List<Article> articles = [
    Article(
      nom: 'Sandwich Thon',
      prix: 10.00,
      quantity: 2,
      imageUrl: 'https://assets.afcdn.com/recipe/20160928/21224_w1024h1024c1cx2128cy1416.webp',
      description: 'plus de fromage et sans onions',
    ),
    Article(
      nom: 'Pack Kids',
      prix: 15.00,
      quantity: 1,
      imageUrl: 'https://c8.alamy.com/compfr/2j0c1cj/doubleburger-double-hamburger-menu-avec-frites-assiette-sans-boisson-2j0c1cj.jpg',
      description: 'Hamburger + Frites + Boisson Viva',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = articles.fold(0, (sum, article) => sum + article.prix * article.quantity);
    double shippingPrice = 10.0;
    double orderPrice = totalPrice + shippingPrice;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mon Panier'),
      ),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return ChartItem(article: articles[index]);
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
          border: Border.all(color: Colors.grey[300]!),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Adresse de livraison',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(color: Colors.grey[300]!),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Default Address',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Prix de l'ordre",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '${totalPrice.toStringAsFixed(2)} Dt',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Prix livraison',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                Text(
                  '${shippingPrice.toStringAsFixed(2)} Dt',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(height: 20, color: Colors.grey),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  '${orderPrice.toStringAsFixed(2)} Dt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showRandomImage(context);
              },
              child: Text('Achetez', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRandomImage(BuildContext context) {
    List<String> randomImages = [
      'https://source.unsplash.com/random/800x600?nature',
      'https://source.unsplash.com/random/800x600?city',
      'https://source.unsplash.com/random/800x600?tech',
    ];
    String randomImage = randomImages[Random().nextInt(randomImages.length)];

    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return RandomImageBottomSheet(randomImage: randomImage);
      },
    ).then((_) {
      _showLivreurInformation(context);
    });
  }

  void _showLivreurInformation(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      builder: (BuildContext context) {
        return LivreurInformationBottomSheet(onConfirm: () {
          Navigator.pop(context);
          _showPaymentMethod(context);
        });
      },
    );
  }

  void _showPaymentMethod(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return PaymentMethodBottomSheet();
      },
    );
  }
}

class PaymentMethodBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Payment Method',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('Credit Card'),
            onTap: () {
              _showCreditCardForm(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.money),
            title: Text('Cash on Delivery'),
            onTap: () {
              Navigator.pop(context);
              // Implement Cash on Delivery logic
            },
          ),
        ],
      ),
    );
  }

  void _showCreditCardForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Credit Card Information'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Card Number',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Expiry Date',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'CVV',
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Close both popups
                // Implement Payment confirmation logic
              },
              child: Text('Confirm Payment'),
            ),
          ],
        );
      },
    );
  }
}
