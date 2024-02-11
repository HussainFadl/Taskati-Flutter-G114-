// i called the open box which i previously oppened in main method
import 'package:hive_flutter/hive_flutter.dart';

class AppLocal {
  static String IMAGE_KEY = 'IMAGE';
  static String NAME_KEY = 'NAME';
  static String ISUPLOAD_KEY = 'ISUPLOAD';

  static cacheData(String key,dynamic  value) async  {
    var box = Hive.box('user');
    await box.put(key, value);
  }

  static getCacheData(String key)  {
    var box = Hive.box('user');
    return   box.get(key);
  }

  static deketeData(String key) {
    var box = Hive.box('user');
    box.delete(key);
  }
}
