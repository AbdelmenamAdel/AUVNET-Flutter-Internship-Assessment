import 'package:auvnet_internship_task/core/database/remote/supabase_config.dart';

class UserImages {
  static Future<String?> getPublicUrl(String bucketName, String path) async {
    try {
      final String publicUrl = SupabaseConfig.client.storage
          .from(bucketName)
          .getPublicUrl(path);
      return publicUrl;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>> getAllImageUrls(String bucketName) async {
    final files = await SupabaseConfig.client.storage.from(bucketName).list();
    return files.map((file) {
      return SupabaseConfig.client.storage
          .from(bucketName)
          .getPublicUrl(file.name);
    }).toList();
  }

  static List<String> userImages = [];
  static Future<void> fetchUserImages() async {
    final List<String> images = ['banner.png', 'menem.jpg', 'abdelmoneim.jpg'];

    images.forEach((image) async {
      await getPublicUrl('user-image', image).then((value) {
        userImages.add(value!);
      });
    });
  }
}
