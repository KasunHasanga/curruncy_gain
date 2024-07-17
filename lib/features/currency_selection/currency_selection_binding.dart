import 'package:currency_grain/features/currency_selection/presentation/controller/currency_selection_ontroller.dart';
import 'package:get/get.dart';

class CurrencySelectionBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<CurrencySelectionController>(() => CurrencySelectionController());
  }
}
