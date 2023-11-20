import 'package:daily_news/features/daily_news/presentation/pages/daily_news_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DailyNewsPage(),
      ),
    ],
  );
}
