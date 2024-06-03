import 'headers.dart';

class AppRoute {
  AppRoute._();

  static final AppRoute appRoute = AppRoute._();

  String splashScreen = '/';
  String home_page = 'hp';
  String detail_page = 'dp';
  String fav_quote_page = 'fqp';

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const SplashScreen(),
    'hp': (context) => const HomePage(),
    'dp': (context) => const DetailPage(),
    'fqp': (context) => const FavQuotePage(),
  };
}
