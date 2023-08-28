import 'package:dicoding_submision_1_restaurant_apps/restaurant_model.dart';
import 'package:flutter/material.dart';


class DetailRestaurant extends StatelessWidget {
  final RestaurantElement restaurant;

  const DetailRestaurant({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Restaurant')
      ),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(restaurant.pictureId),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800,
                      fontSize: 24
                    ),  
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.location_on, color: Colors.red),
                      Text(
                        restaurant.city,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                      )
                    ],
                  ),
                  Text(restaurant.description, maxLines: 4),
                  const Divider(color: Colors.black54),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: restaurant.menus.foods.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(restaurant.menus.foods[index].name),
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            child: ListView.builder(
                              itemCount: restaurant.menus.drinks.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(restaurant.menus.drinks[index].name),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}