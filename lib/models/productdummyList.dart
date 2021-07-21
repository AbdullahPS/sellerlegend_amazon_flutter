import 'product.dart';

class DummyProduct {
  static List<Product> productInfo = [];

  static void initData(int size) {
    for (int i = 0; i < size; i++) {
      productInfo.add(
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
    productInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('Product_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('Product_', '')) ?? 0;

      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  static void sortStatus(bool isAscending) {
    productInfo.sort((a, b) {
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
}
