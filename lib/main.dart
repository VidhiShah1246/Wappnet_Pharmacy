import 'package:flutter/material.dart';
import 'package:pharmacy/ui/home.dart';
import 'package:pharmacy/ui/login.dart';
import 'package:pharmacy/utils/shared_pref_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // Future<int> getPage () {
  //   SharedPrefUtils.getPref().then((SharedPreferences sp) async {
  //     if (sp != null) {
  //       if (sp.getString(SharedPrefUtils.userData) != null) {
  //         return 0;
  //       }
  //       else
  //         return 1;
  //     }
  //     else
  //       return 1;
  //   }
  //   );
  //   throw Exception;
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      //home: getPage() == 1 ? LoginPage(title: 'Flutter Demo Home Page', key: null,) : HomePage(title : 'Home'),
      home: HomePage(title : 'Home'),
    );
  }
}
