import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
// import 'package:flutter_uxcam/flutter_uxcam.dart';

import 'app/routes/app_pages.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  /*
  FlutterUxcam.optIntoSchematicRecordings(); // Confirm that you have user permission for screen recording
  FlutterUxConfig config = FlutterUxConfig(
    userAppKey: "r516z16gznlpsca",
    enableAutomaticScreenNameTagging: false);
  FlutterUxcam.startWithConfiguration(config);

   */
  
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Radio Saphir",
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
