import 'package:darts_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:darts_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:darts_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';


class AuthInjector {
  static Future<void> setup(GetIt getIt) async {
    getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
    getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()));
  }
}
