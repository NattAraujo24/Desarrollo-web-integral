import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:learning_b/modules/restaurant/entities/restaurant.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Detail extends StatelessWidget {
  const Detail({
    super.key,
    required this.restaurant,
  });

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carrusel de imágenes
            SizedBox(
              height: 200,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                ),
                items: restaurant.images
                    .map((item) => Container(
                          child: Center(
                            child: Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 16.0),

            // Fila con nombre del restaurante a la izquierda y rating a la derecha
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Nombre del restaurante
                Expanded(
                  child: Text(
                    restaurant.name,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Calificación (rating) a la derecha
                StarRating(
                  rating: restaurant.rating / restaurant.count,
                  color: Colors.orange[200],
                  borderColor: Colors.grey,
                  starCount: 5,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 16.0),

            // Descripción del restaurante
            Text(
              restaurant.description,
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
