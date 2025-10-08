import 'package:go_router/go_router.dart';
import '../../presentation/pages/home_page.dart';

class HomeRoutes {
  static final routes = [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
  ];
}
