import 'package:bot_toast/bot_toast.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_task_app/core/router/app_router.dart';
import 'package:mind_task_app/core/themes/colors.dart';
import 'package:mind_task_app/core/utils/utils.dart';
import 'package:mind_task_app/data/sources/api/dio.dart';
import 'package:material_color_gen/material_color_gen.dart';
import 'package:mind_task_app/data/sources/local/sharedpreferences.dart';
import 'package:mind_task_app/features/layout/logic/cubit/layout_cubit.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Utiles.token = CacheHelper.loadData(key: 'token') ?? '';
  EasyLocalization.logger.enableBuildModes = [];
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(
    EasyLocalization(
      startLocale: const Locale('ar', 'EG'),
      supportedLocales: const [
        Locale('ar', 'EG'),
        Locale('en', 'US'),
      ],
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeLayoutCubit(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          builder: (context, child) {
            final botToastBuilder = BotToastInit();
            child = botToastBuilder(context, child);
            return child;
          },
          onGenerateRoute: RouteGenerator.getRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primarySwatch: AppColors.primary.toMaterialColor(),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          initialRoute: Routes.layoutRoute
          // Utiles.token.isEmpty ? Routes.loginScreen : Routes.layoutRoute,
          ),
    );
  }
}
