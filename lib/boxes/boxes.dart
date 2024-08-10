import 'package:digital_market/models/local_products/recently_viewed_products.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<LocalProducts> getProducts() =>
      Hive.box<LocalProducts>('products');
}
