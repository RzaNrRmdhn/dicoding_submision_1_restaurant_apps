import 'package:dicoding_submision_1_restaurant_apps/restaurant_model.dart';
import 'package:flutter/material.dart';
import 'package:dicoding_submision_1_restaurant_apps/restaurant_screen.dart';
import 'package:dicoding_submision_1_restaurant_apps/detail_restaurant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants Apps',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomeScreen(),
        '/detail': (context) => DetailRestaurant(restaurant:  ModalRoute.of(context)?.settings.arguments as RestaurantElement),
      },
    );
  }
}

