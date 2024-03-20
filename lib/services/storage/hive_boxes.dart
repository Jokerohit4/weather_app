



import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/utils/constants/app_keys.dart';

class HiveBoxes{


 Future<Box> signedInStatus(){
    return Hive.openBox(AppKeys.signedInStatus);
  }

 Future<Box> userData(){
   return Hive.openBox(AppKeys.signedInStatus);
 }

 Future<Box> weatherBox(){
   return Hive.openBox(AppKeys.weatherBox);
 }



}