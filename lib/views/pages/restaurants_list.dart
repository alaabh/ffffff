import 'package:flutter/material.dart';

import 'one_resto.dart';

class RestaurantListComponent extends StatefulWidget {
  final List<Map<String, dynamic>> restaurants;

  const RestaurantListComponent({super.key, required this.restaurants});
  @override
  _RestaurantListComponentState createState() =>
      _RestaurantListComponentState();
}

class _RestaurantListComponentState extends State<RestaurantListComponent> {
  // Track the like state for each item
  List<bool> liked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ]; // Assuming 3 items for example

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(widget.restaurants.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      ProfileResto(restaurant: widget.restaurants[index])),
            );
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Stretch content to fill width
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: Image.network(
                            widget.restaurants[index]['img'],
                            width:
                                double.infinity, // Use full width of container
                            height: 200, // Fixed height
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Align text to the start
                            children: [
                              Text(
                                widget.restaurants[index]['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(height: 5), // Space between text lines
                              Text(
                                'Prix : ${widget.restaurants[index]['estimated_price']}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize:
                                      14, // Slightly larger font size for price
                                ),
                              ),
                              SizedBox(height: 5), // Space between text lines
                              Text(
                                widget.restaurants[index]['special_offre']
                                            .length ==
                                        0
                                    ? ""
                                    : '${widget.restaurants[index]['special_offre'][0]}',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          //liked[index] = !liked[index];
                        });
                      },
                      child: Icon(
                        liked[index] ? Icons.favorite : Icons.favorite_border,
                        color: liked[index] ? Colors.green : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
