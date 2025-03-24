import 'package:deep_link/views/product/product.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.green,
        title: const Text('Deep Link', style: TextStyle(
          color: Colors.white,
        ),),
      ),

      body: Center(
        child: ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const ProductView(productID: '60')));
        }, child: Text("Product Page")),
      ),
    );
  }
}
