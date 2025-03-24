import 'dart:async';

import 'package:deep_link/views/home/home.dart';
import 'package:deep_link/views/product/product.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _initDeepLink();
  }

  StreamSubscription? _sub;

  final navigatorKey = GlobalKey<NavigatorState>();

  void _initDeepLink() async {
    _sub = uriLinkStream.listen((Uri? uri) {
      if (uri != null) {
        if (uri.scheme == 'wormhole' && uri.host == 'product') {

          final productID = uri.pathSegments.isEmpty ? '' : uri.pathSegments.elementAt(0);

          if (productID.isNotEmpty) {
            navigatorKey.currentState!.push(
              MaterialPageRoute(
                builder: (_) => ProductView(productID: productID),
              ),
            );

          }
        }
      } else {
        print('URI isa null');
      }
    }, onError: (error) {
      print('Deep link error: $error');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _sub!.cancel();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorKey: navigatorKey,
      home: const HomeView(),
    );
  }
}
