import 'dart:async';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'home_directory/home_page.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(Duration(milliseconds: 6100), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 390, height: 812, allowFontScaling: true);
    return Scaffold(
      body: FlareActor(
        "assets/rocketlaunch.flr",
        alignment: Alignment.center,
        fit: BoxFit.cover,
        animation: "success",
      ),
    );
  }
}