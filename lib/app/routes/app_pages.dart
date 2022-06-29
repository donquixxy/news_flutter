import 'package:get/get.dart';

import '../modules/bookmark/bindings/bookmark_binding.dart';
import '../modules/bookmark/views/bookmark_view.dart';
import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/homeIndex/bindings/home_index_binding.dart';
import '../modules/homeIndex/views/home_index_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
    ),
    GetPage(
      name: _Paths.HOME_INDEX,
      page: () => HomeIndexView(),
      binding: HomeIndexBinding(),
    ),
    GetPage(
      name: _Paths.BOOKMARK,
      page: () => BookmarkView(),
      binding: BookmarkBinding(),
    ),
  ];
}
