import 'package:flutter/material.dart';


class Routes {

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      // case Routes.layoutRoute:
      //   return MaterialPageRoute(
      //     builder: (_) => const Layout(child: HomeScreen()),
      //   );
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
