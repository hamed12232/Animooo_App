import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static const String routeName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Category Screen'),
      ),
    );
  }
}