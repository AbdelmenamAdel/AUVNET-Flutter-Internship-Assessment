import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  // Singleton pattern
  factory HiveDatabase() => _instance;
  HiveDatabase._();
  static final HiveDatabase _instance = HiveDatabase._();

  Box? userImages;

  Future<void> init() async {
    await Hive.initFlutter();
    userImages = await Hive.openBox('userImages');
  }

  Future<void> saveImageList(List<String> images) async {
    await userImages!.put('imageList', images);
  }

  List<String> getImageList() {
    return userImages!
        .get('imageList', defaultValue: <String>[])!
        .cast<String>();
  }

  Future<void> clearAllBox() async {
    await userImages!.clear();
  }
}
