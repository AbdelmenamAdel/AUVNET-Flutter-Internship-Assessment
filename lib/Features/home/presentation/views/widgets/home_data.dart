import 'package:auvnet_internship_task/Features/home/data/models/home_data_model.dart';
import 'package:auvnet_internship_task/core/database/remote/supabase_config.dart';

class HomeData {
  static List<HomeDataModel> services = [];
  static List<HomeDataModel> restaurants = [];
  static Future<void> getHomeData() async {
    var servicesModels = await SupabaseConfig.client.from('services').select();
    var sertaurantsModels = await SupabaseConfig.client
        .from('restaurants')
        .select();

    services = servicesModels.map((e) => HomeDataModel.fromMap(e)).toList();
    restaurants = sertaurantsModels
        .map((e) => HomeDataModel.fromMap(e))
        .toList();
  }
}
