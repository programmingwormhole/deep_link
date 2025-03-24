import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final String productID;

  const ProductView({super.key, required this.productID});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: Text('Product ID: $productID', style: const TextStyle(
          color: Colors.white,
        ),),
      ),
      body: Center(
        child: Text('Product ID: $productID',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
      ),
    );
  }
}
