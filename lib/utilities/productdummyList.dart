import '../models/product.dart';

class DummyProduct {
  static List<Product> initProductInfo = [];
  static List<Product> productInfo = [];

  static void initData(int size) {
    for (int i = 0; i < size; i++) {
      initProductInfo.add(
        Product(
          "Product_$i",
          i % 3 == 0,
          'x Dollar',
          'SKU_$i',
          'Asin_$i',
        ),
      );
    }
  }

  ///
  /// Single sort, sort Name's id
  static void sortName(bool isAscending) {
    initProductInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('Product_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('Product_', '')) ?? 0;

      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  static void sortStatus(bool isAscending) {
    initProductInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('Product_', '')) ?? 0;
        int bId = int.tryParse(b.name.replaceFirst('Product_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }

  ///TODO:Implement every one of these standalone
  void searchAsin(String searchQuery) {}
  void searchSKU(String searchQuery) {}
  void searchName(String searchQuery) {}

  static void searchAllFields(String searchQuery) {
    List<Product> tmp = [];
    productInfo.clear();

    String name = searchQuery;
    print("filter cars for name " + name);
    if (name.isEmpty) {
      tmp.addAll(initProductInfo);
    } else {
      for (Product p in initProductInfo) {
        if (p.name.toLowerCase().contains(name.toLowerCase())) {
          tmp.add(p);
        }
        if (p.asin.toLowerCase().contains(name.toLowerCase())) {
          if (!tmp.contains(p)) tmp.add(p);
        }
        if (p.sku.toLowerCase().contains(name.toLowerCase())) {
          if (!tmp.contains(p)) tmp.add(p);
        }
      }
    }
    productInfo = tmp;
  }
}
