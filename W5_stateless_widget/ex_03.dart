import 'package:flutter/material.dart';

enum Product {
  dart(title: 'Dart', description: 'The best object language', image: 'assets/assets_w5/ex3/dart.png'),
  flutter(title: 'Flutter', description: 'The best mobile widget library', image: 'assets/assets_w5/ex3/flutter.png'),
  firebase(title: 'Firebase', description: 'The best cloud database', image: 'assets/assets_w5/ex3/firebase.png');

  final String title;
  final String description;
  final String image;

  const Product({required this.title, required this.description, required this.image});
}


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(title: Text('Products')),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: SingleChildScrollView( 
        child: Column(
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
        ),
      ),
    ),
  ));
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(alignment: Alignment.centerLeft, child: Image.asset(product.image, height: 100, width: 100),),
            SizedBox(height: 8),
            Text(product.title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(product.description, style: TextStyle(fontSize: 20, color: Colors.grey[600])),
          ],
        ),
        ) 
    );
  }
}