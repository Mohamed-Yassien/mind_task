import 'package:flutter/material.dart';
import 'package:mind_task_app/features/layout/ui/layout.dart';
import 'package:mind_task_app/features/login/ui/login_screen.dart';

class Routes {
  static const String layoutRoute = "/layout"; 
  static const String loginRoute = "/login"; 
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.layoutRoute:
        return MaterialPageRoute(
          builder: (_) => const LayoutScreen(),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("مسار غير موجود"),
              ),
              body: const Center(child: Text("مسار غير موجود")),
            ));
  }
}

class CmsPageArguments {
  String pageName;

  CmsPageArguments({
    required this.pageName,
  });
}

class PassIntArguments {
  int id;

  PassIntArguments({
    required this.id,
  });
}
