import 'package:get_it/get_it.dart';
import 'package:shoppe/di/cubits.dart';
import 'package:shoppe/di/order.dart';
import 'package:shoppe/di/product.dart';
import 'package:shoppe/di/user.dart';
import 'cart.dart';
import 'category.dart';
import 'common.dart';
import 'delivery.dart';

final sl = GetIt.instance;

// Main Initialization
Future<void> init() async {
  // Register features
  registerCategoryFeature();
  registerProductFeature();
  registerUserFeature();
  registerDeliveryInfoFeature();
  registerCartFeature();
  registerOrderFeature();

  // Register Cubits
  registerCubits();

  // Register common dependencies
  registerCommonDependencies();
}
