import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text("Mission Integrity", style: Font_Style()
            .montserrat_SemiBold(Font_Style.secondaryLightColor, 22.0),),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back_ios, size: 24.0,
            color: Font_Style.secondaryLightColor,),
        ),
      ),
    );
  }
}
