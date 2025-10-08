import 'package:darts_app/features/auth/confing/router/auth_routes.dart';
import 'package:darts_app/features/home/confing/router/home_routes.dart';
import 'package:go_router/go_router.dart';


class AppRouter {
  static final router = GoRouter(
        initialLocation: '/login',

    routes: [
      ...AuthRoutes.routes,
      ...HomeRoutes.routes,
    ],
  );
}
