import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mbbschats/component/dimension.dart';
import 'package:mbbschats/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SC.getScreen(context);
    return GetMaterialApp(
       debugShowCheckedModeBanner: false,
       home: SignUpPage(),
     );
  }
}



