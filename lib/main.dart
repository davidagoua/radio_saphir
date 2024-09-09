import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://cf30123dd989206c0485f6eb0c1baf15@o4507170571943936.ingest.de.sentry.io/4507920021520464';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Radio Saphir",
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
      ),
    )
  );
  
  
}
