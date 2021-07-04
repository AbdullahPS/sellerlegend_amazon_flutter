import 'package:flutter/cupertino.dart';

class Product {
  final String name;
  final String price;
  final String asin;
  final String imageUrl;

  Product(
      {this.name = '', this.price = '', this.asin = '', this.imageUrl = ''});
}
