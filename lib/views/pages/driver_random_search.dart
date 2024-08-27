import 'package:flutter/material.dart';
import 'dart:async';

class RandomImageBottomSheet extends StatelessWidget {
  final String randomImage;

  const RandomImageBottomSheet({Key? key, required this.randomImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () {
      Navigator.pop(context);
    });

    return Container(
      height: 200,
      padding: EdgeInsets.all(20),
      child: Center(
        child: Image.network(randomImage, fit: BoxFit.cover),
      ),
    );
  }
}

class LivreurInformationBottomSheet extends StatelessWidget {
  final VoidCallback onConfirm;

  const LivreurInformationBottomSheet({Key? key, required this.onConfirm}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Livreur Information',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Full Name: jem3i jem3i'),
                  Text('ID Code: 123456789'),
                  Text('Distance: 2.5 km'),
                  Text('Delivery Price: 7.00 Dt'),
                ],
              ),
            ],
          ),
          Spacer(),
          ElevatedButton(
            onPressed: onConfirm,
            child: Text('Confirmez l\'ordre', style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size(double.infinity, 50),
            ),
          ),
        ],
      ),
    );
  }
}

