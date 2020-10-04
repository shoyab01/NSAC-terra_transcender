import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:url_launcher/url_launcher.dart';

class ExternalLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 24.0,)),
        title: Text("External Links", style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 24.0),),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w, top: 12.0.h, bottom: 12.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Here are some external links in which you can know more about unity in NASA Astronauts", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 18),),
              Spacer(flex: 1,),
              InkWell(
                onTap: () {
                  launchURL("https://www.nasa.gov/exploration/whyweexplore/Why_We_09.html");
                },
                  child: Text("https://www.nasa.gov/exploration/whyweexplore/Why_We_09.html", style: Font_Style().montserrat_Regular_Underline(Font_Style.secondaryColor, 14),)),
              Spacer(flex: 1,),
              InkWell(
                onTap: () {
                  launchURL("https://www.nasa.gov/johnson/HWHAP/the-overview-effect/");
                },
                  child: Text("https://www.nasa.gov/johnson/HWHAP/the-overview-effect/", style: Font_Style().montserrat_Regular_Underline(Font_Style.secondaryColor, 14),)),
              Spacer(flex: 1,),
              InkWell(
                onTap: () {
                  launchURL("https://www.nasa.gov/centers/hq/eodm/documents_resources/resources_for_learning_and_talking_about_racism_and_inequality");
                },
                  child: Text("https://www.nasa.gov/centers/hq/eodm/documents_resources/resources_for_learning_and_talking_about_racism_and_inequality", style: Font_Style().montserrat_Regular_Underline(Font_Style.secondaryColor, 14),)),
              Spacer(flex: 1,),
              InkWell(
                onTap: () {
                  launchURL("https://www.nasa.gov/offices/odeo/nasaunity");
                },
                  child: Text("https://www.nasa.gov/offices/odeo/nasaunity", style: Font_Style().montserrat_Regular_Underline(Font_Style.secondaryColor, 14),)),
              Spacer(flex: 6,),
            ],
          ),
        ),
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
