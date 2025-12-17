import 'package:go_router/go_router.dart';
import '../../feature/pharse/presentation/screens/screen_a.dart';
import '../../feature/pharse/presentation/screens/screen_b.dart';
import '../../feature/pharse/presentation/screens/screen_c.dart';
import '../../splash_Screen.dart';

class AppRouter {
  static const String splash = '/';
  static const String screenA = '/screen-a';
  static const String screenB = '/screen-b';
  static const String screenC = '/screen-c';

  static final GoRouter router = GoRouter(
    initialLocation: splash,
    routes: [
      GoRoute(
        path: splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: screenA,
        builder: (context, state) => const ScreenA(),
      ),
      GoRoute(
        path: screenB,
        builder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return ScreenB(
            phrase: extra?['phrase'],
            hashtags: extra?['hashtags'],
          );
        },
      ),
      GoRoute(
        path: screenC,
        builder: (context, state) => const ScreenC(),
      ),
    ],
  );
}