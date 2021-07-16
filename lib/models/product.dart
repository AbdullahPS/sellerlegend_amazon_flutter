class Product {
  final String name;
  final String price;
  final String asin;
  final String sku;
  final bool status;
  String imageUrl = '';

  Product(this.name, this.status, this.price, this.asin, this.sku);
}
