// i called the open box which i previously oppened in main method
  import 'package:hive_flutter/hive_flutter.dart';
   class AppLocal{


    static String IMAGE_KEY = 'IMAGE';
    static String NAME_KEY = 'IMAGE';
    static String ISUPLOAD_KEY = 'ISUPLOAD';
    

    static cacheData(String key, value ){
      var box = Hive.box('user');
      box.put(key, value);


    }
  static  dynamic  getCacheData(String key){

      var box = Hive.box('user');
      return box.get(key);

    }
   }

                       
                       
