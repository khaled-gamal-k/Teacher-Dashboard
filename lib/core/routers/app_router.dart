import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/students/presentation/cubit/students_cubit.dart';
import '../../features/students/presentation/views/students_view.dart';
import '../../layout/app_layouts.dart';
import '../services/get_it_service.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';

import '../../features/auth/presentation/views/signin_view.dart';
import 'refresh_helper.dart';
import 'routers_constants.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter routers = GoRouter(
    refreshListenable: GoRouterRefreshStream(Supabase.instance.client.auth.onAuthStateChange),
    redirect: (_, state) {
      final session = Supabase.instance.client.auth.currentSession;

      final isLoggedIn = session != null;
      final isAuthRoute = state.matchedLocation == Routers.login;

      if (isLoggedIn && isAuthRoute) {
        return Routers.home;
      }

      if (!isLoggedIn && !isAuthRoute) {
        return Routers.login;
      }

      return null;
    },

    routes: [
      GoRoute(
        path: Routers.login,
        builder: (_, _) =>
            BlocProvider(create: (_) => getIt<AuthCubit>(), child: const SigninView()),
      ),
      ShellRoute(
        builder: (_, _, child) => AppLayouts(child: child),
        routes: [
          GoRoute(
            path: Routers.home,
            builder: (_, _) => BlocProvider(
              create: (context) => getIt<HomeCubit>()..init(),
              child: const HomeView(),
            ),
          ),
          GoRoute(
            path: Routers.students,
            builder: (_, _) => BlocProvider(
              create: (context) => getIt<StudentsCubit>()..init(),
              child: const StudentsView(),
            ),
          ),
        ],
      ),
    ],
  );
}
