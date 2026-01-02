import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:startupscout/routes/app_pages.dart';
import 'package:startupscout/routes/app_routes.dart';
import 'package:startupscout/utils/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await GetStorage.init();
  runApp(const StartupScout());
}

class StartupScout extends StatelessWidget {
  const StartupScout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        title: "Startup Scout",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppConstants.backgroundColor,
          textTheme: GoogleFonts.ubuntuTextTheme(),
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppConstants.primaryColor,
            surface: AppConstants.backgroundColor,
          ),
        ),
        initialRoute: AppRoutes.splashscreen,
        getPages: AppPages.pages,
      ),
    );
  }
}
