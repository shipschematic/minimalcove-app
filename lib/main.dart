import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:minimalcove_app/helpers/services/storage/local_storage.dart';
import 'package:minimalcove_app/helpers/theme/app_theme.dart';
import 'package:minimalcove_app/helpers/theme/theme_customizer.dart';
import 'package:minimalcove_app/route/route_method.dart';
import 'package:minimalcove_app/route/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  AppStyle.init();
  await ThemeCustomizer.init();
  runApp(const MinimalCoveApp());
}

class MinimalCoveApp extends StatelessWidget {
  const MinimalCoveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Minimal Cove',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeCustomizer.instance.theme,
      initialRoute: route.appLayout,
      getPages: getPageRoute(),
      defaultTransition: Transition.noTransition,
    );
  }
}
