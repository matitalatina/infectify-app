import 'package:get_it/get_it.dart';
import 'package:infectify/client/region.dart';

GetIt getIt = GetIt.instance;

initializeServiceLocator() {
  getIt.registerSingleton(RegionClient());
}