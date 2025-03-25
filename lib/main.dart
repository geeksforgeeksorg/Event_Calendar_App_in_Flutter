import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

/// Root widget of the application, using GetMaterialApp for navigation.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // Hides the debug banner.
      debugShowCheckedModeBanner: false,
      title: 'Event Calendar',

      /// Defines the initial route when the app starts.
      initialRoute: AppPages.INITIAL,

      /// Registers all application routes using GetX navigation.
      getPages: AppPages.routes,
    );
  }
}
