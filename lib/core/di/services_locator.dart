import 'package:auvnet_internship_task/Features/auth/data/repositories/auth_repository.dart';
import 'package:auvnet_internship_task/Features/auth/presentation/manager/auth_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  sl.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  // Register repositories
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());

  // Register BLoCs
  sl.registerFactory<AuthBloc>(
    () => AuthBloc(authRepository: sl<AuthRepository>()),
  );

  // Register other services as needed
  // Example: sl.registerLazySingleton<SomeService>(() => SomeService());
}
