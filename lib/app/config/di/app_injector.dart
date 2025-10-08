import 'package:darts_app/features/auth/confing/di/auth_injector.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

class AppInjector {
  static Future<void> setup() async {
   await AuthInjector.setup(getIt);
  // await HomeInjector.setup(getIt);
  }
}
