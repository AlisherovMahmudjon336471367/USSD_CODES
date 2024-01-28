import 'package:rexar_shop/utils/tools/file_importers.dart';

class RouteName {
  static const home = '/home';
  static const internetCollections = '/internetCollections';
}

class AppRouter {
  static Route generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    var args = settings.arguments;
    switch (settings.name) {
      case RouteName.home:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      // case RouteName.internetCollections:
      //   return MaterialPageRoute(
      //       builder: (_) => CollectionPage(company: args as CompanyModel));

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
