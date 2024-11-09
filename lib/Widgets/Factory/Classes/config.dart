import 'dart:io';
import 'package:money_counter/Widgets/Factory/Classes/android_factory.dart';
import 'package:money_counter/Widgets/Factory/Classes/ios_factory.dart';
import 'package:money_counter/Widgets/Factory/Interfaces/abstract_factory.dart';

class Config {
  static Config? _instance;
  Factory? _factory;
   
  Config._init() {
    if (Platform.isAndroid){
      _factory = AndroidFactory();
    } else if (Platform.isIOS) {
      _factory = IOSFactory();
    } else {
      _factory = null;
      }
  }
  
  Factory? get getFactory => _factory;

  factory Config() {
    _instance ??= Config._init();
    return _instance!;
  } 
}