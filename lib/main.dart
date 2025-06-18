import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:auvnet_internship_task/Features/welcome/views/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/database/local/cache_helper.dart';
import 'core/database/remote/supabase_config.dart';
import 'core/di/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  await CacheHelper.init();
  await SupabaseConfig.initialize();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    DevicePreview(
      enabled: true, // Set to true to enable Device Preview
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthBloc>(),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: SplashView()),
    );
  }
}
