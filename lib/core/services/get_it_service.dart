import 'package:get_it/get_it.dart';
import 'auth_service.dart';
import 'database_service.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

import '../network/supabase_auth_config.dart';
import '../network/supabase_database_config.dart';

final getIt = GetIt.instance;

class GetItService {
  static Future<void> init() async {
    await _setupServices();
    await _setupRepos();
    await _setupCubits();
  }

  static Future<void> _setupServices() async {
    getIt.registerLazySingleton<AuthService>(() => SupabaseAuthConfig());
    getIt.registerLazySingleton<DatabaseService>(() => SupabaseDatabaseConfig());
  }

  static Future<void> _setupRepos() async {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  }

  static Future<void> _setupCubits() async {
    getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
  }
}
