import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:terra_transcender/welcome.dart';
import 'ThemeData/fontstyle.dart';
import 'home_directory/astronauts_directory/application.dart';
import 'home_directory/astronauts_directory/astronauts.dart';
import 'home_directory/home_page.dart';
import 'home_directory/mission_directory/mission.dart';
import 'home_directory/overview_directory/overview.dart';
import 'home_directory/spacenm_directory/spacenm.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Application.initApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Application.router.generator,
      title: 'Terra Transcender',
      theme: ThemeData(
          scaffoldBackgroundColor: Font_Style.primaryColor,
          primaryColor: Font_Style.primaryColor,
          cursorColor: Font_Style.secondaryColor),
      routes: {
        '/': (context) => Welcome(),
        'home_page': (context) => HomePage(),
        'astronauts': (context) => Astronauts(),
        'overview': (context) => Overview(),
        'mission': (context) => Mission(),
        'spacenm': (context) => Spacenm(),
      },
      initialRoute: '/',
    );
  }
}