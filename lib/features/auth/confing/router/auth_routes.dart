import 'package:darts_app/features/auth/presentation/pages/login_page.dart';
import 'package:go_router/go_router.dart';


class AuthRoutes {
  static final routes = [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    // GoRoute(
    //   path: '/register',
    //   builder: (context, state) => const RegisterPage(),
    // ),
  ];
}
