import 'package:get_it/get_it.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/auth/data/repos/auth_repo.dart';
import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

import '../../features/home/data/repos/home_repo_impl.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
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
    getIt.registerLazySingleton<SupabaseAuthConfig>(() => SupabaseAuthConfig());
    getIt.registerLazySingleton<SupabaseDatabaseConfig>(() => SupabaseDatabaseConfig());
  }

  static Future<void> _setupRepos() async {
    getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
    getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  }

  static Future<void> _setupCubits() async {
    getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt()));
    getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  }
}
