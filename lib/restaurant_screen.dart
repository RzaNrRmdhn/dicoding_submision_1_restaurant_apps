import 'package:dicoding_submision_1_restaurant_apps/restaurant_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants Apps'),
      ),

      body: SafeArea(
        child: FutureBuilder<String>(
          future: DefaultAssetBundle.of(context).loadString('assets/local_restaurant.json'),
          builder: (context, snapshot) {
            final List<RestaurantElement> restaurants = parseRestaurant(snapshot.data);
            return ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, index) {
                return _builderRestaurant(context, restaurants[index]);
            });
          },
        ),
      ),
    );
  }
  Widget _builderRestaurant(BuildContext context, RestaurantElement restaurant){
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 5.0,
      ),
      leading: Image.network(
        restaurant.pictureId,
        width: 100,
      ),
      title: Column(
        children: <Widget>[
          Text(
            restaurant.name,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18
              ),
          ),
          Text(restaurant.city),
          Text(restaurant.rating.toString())
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/detail', arguments: restaurant);
      },
    );
  }
}
