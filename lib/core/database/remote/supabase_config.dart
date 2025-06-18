import 'package:auvnet_internship_task/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseConfig {
  // ✨ استبدل القيم دي بقيم مشروعك
  static const String supabaseUrl = Constants.supabaseUrl;
  static const String supabaseAnonKey = Constants.supabaseAnonKey;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
      authOptions: FlutterAuthClientOptions(authFlowType: AuthFlowType.pkce),
      storageOptions: const StorageClientOptions(retryAttempts: 3),
      realtimeClientOptions: const RealtimeClientOptions(
        logLevel: RealtimeLogLevel.info,
      ),
    );
  }

  // تقدر تستخدمه بعد التهيئة من أي مكان
  static SupabaseClient get client => Supabase.instance.client;
}
