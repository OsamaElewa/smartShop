
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_shop/smart_shop.dart';

import 'config/bloc_observer.dart';
import 'config/local/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer=MyBlocObserver();
  Platform.isAndroid ?
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: 'AIzaSyBdcu1ofgS1bpcLGkYnGMy01WO8KZoMW_M',
        appId: '1:17474594596:android:4a9c5e4bfb8898fdeaf5b1',
        projectId: 'smart-shop-eda60',
        messagingSenderId: '17474594596',
      )
  )
  : await Firebase.initializeApp();
  await CacheHelper.init();
   if(CacheHelper.getData(key: 'isDark') == null){
     CacheHelper.saveData(key: 'isDark', value: false);
   }
  runApp(const SmartShop());
}

