import 'package:get/get.dart';

import '../controllers/home_index_controller.dart';

class HomeIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeIndexController>(
      () => HomeIndexController(),
    );
  }
}
