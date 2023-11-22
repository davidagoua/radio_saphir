import 'package:get/get.dart';

import '../modules/ArticleDetails/bindings/article_details_binding.dart';
import '../modules/ArticleDetails/views/article_details_view.dart';
import '../modules/Infos/bindings/infos_binding.dart';
import '../modules/Infos/views/infos_view.dart';
import '../modules/Live/bindings/live_binding.dart';
import '../modules/Live/views/live_view.dart';
import '../modules/News/bindings/news_binding.dart';
import '../modules/News/views/news_view.dart';
import '../modules/NewsDetails/bindings/news_details_binding.dart';
import '../modules/NewsDetails/views/news_details_view.dart';
import '../modules/Resume/bindings/resume_binding.dart';
import '../modules/Resume/views/resume_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.RESUME,
      page: () => const ResumeView(),
      binding: ResumeBinding(),
    ),
    GetPage(
      name: _Paths.LIVE,
      page: () => const LiveView(),
      binding: LiveBinding(),
    ),
    GetPage(
      name: _Paths.NEWS,
      page: () => const NewsView(),
      binding: NewsBinding(),
    ),
    GetPage(
      name: _Paths.INFOS,
      page: () => const InfosView(),
      binding: InfosBinding(),
    ),
    GetPage(
      name: _Paths.NEWS_DETAILS,
      page: () => const NewsDetailsView(),
      binding: NewsDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ARTICLE_DETAILS,
      page: () => const ArticleDetailsView(),
      binding: ArticleDetailsBinding(),
    ),
  ];
}
