import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            FlareActor(
              "assets/mission_stars.flr",
              alignment: Alignment.center,
              fit: BoxFit.cover,
              animation: "star",
            ),
            Container(
              padding: EdgeInsets.only(top: 12.0.h, bottom: 12.0.h, left: 12.0.w, right: 12.0.w),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back_ios, size: 24.0,
                            color: Colors.amber[600].withOpacity(0.9),),
                        ),
                        SizedBox(width: 12.0.w,),
                        Text("Mission Integrity", style: Font_Style().montserrat_SemiBold(Colors.amber[600].withOpacity(0.9), 24.0),),
                      ],
                    ),
                    SizedBox(height: 18.0.h,),
                    Text(
                      "Space is a critical environment. Earth is a critical environment too. Space missions are built on collaboration, team-work, trust, inclusion and accommodation of differences.",
                      style: Font_Style().montserrat_SemiBold(Colors.amber[200].withOpacity(0.8), 16),
                    ),
                    SizedBox(height: 12.0.h,),
                    Text(
                        "What if we integrated the values underneath space missions in everyday life to combat problems of inequality?",
                      style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),
                    ),
                    SizedBox(height: 12.0.h,),
                    Text(
                      "On September 6, 2019, NASA launched a campaign to unify the NASA workforce in working toward unified agency goals.",
                      style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),
                    ),
                    Font_Style.dividerSet(),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text("RACISM", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 12.0.h,),
                    Text(
                      "One of the most brutal inequalities that plagues society, it is prevalent everywhere not just in the US or Africa. Albert Einstein called it ‘the disease of America’.",
                      style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),
                    ),
                    SizedBox(height: 12.0.h,),
                    Text(
                      "Racial discrimination stunts growth of societies by being a disadvantage to coloured people, in terms of education, careers, health care and social wellbeing.",
                      style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),
                    ),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("The latest black death- of George Floyd has sparked off a movement to end racism of all kinds."),
                    SizedBox(height: 12.0.h,),
                    RichText(
                      text: TextSpan(
                          text: 'NASA’s first black administrator, ', style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),
                          children: <TextSpan>[
                            TextSpan(text: 'Charles Bolden', style: Font_Style().montserrat_SemiBold(Colors.amber[200].withOpacity(0.9), 16.5)),
                            TextSpan(text: " faced discrimination since his earliest days as a young man. In 1968, Bolden first graduated from the Naval Academy. (He's a retired major general in the U.S. Marine Corps.) But he almost didn't make it into the academy simply because he was black.", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16)),
                          ]
                      ),
                    ),
                    SizedBox(height: 12.0.h,),
                    Align(
                      alignment: Alignment.centerLeft,
                        child: Text("In his words...", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 17),)),
                    SizedBox(height: 12.0.h,),
                    Text('''"When we look in the mirror, we're looking at something we don't like. Well, that is the nation that we are, and it's up to every single one of us to change it," Bolden said. "So I call on my White brothers and sisters and tell them: Everything you want me to say or you like [retired Black astronauts] Leland [Melvin] or Mae [Jemison] saying, you ought to be saying it."''', style: Font_Style().montserrat_medium(Colors.amber[200].withOpacity(0.8), 16),),
                    SizedBox(height: 12.0.h,),
                    Text('''"My hope is that young people will cause us to go much farther than we've gone in the past so that we can actually solve some of these problems."''', style: Font_Style().montserrat_medium(Colors.amber[200].withOpacity(0.8), 16),),
                    SizedBox(height: 8.0.h,),
                    Align(
                      alignment: Alignment.centerRight,
                        child: Text("-Charles Bolden", style: Font_Style().montserrat_SemiBold(Colors.amber[200].withOpacity(0.9), 18),)),
                    SizedBox(height: 12.0.h,),
                    Text("Till today there are over 20 black astronauts", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
                    Font_Style.dividerSet(),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(title, textAlign: TextAlign.left, overflow: TextOverflow.clip, textDirection: TextDirection.ltr, style: Font_Style().montserrat_Bold_underline(Colors.white, 22),));
  }

  Widget _subTitle(String subTitle) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(subTitle, style: Font_Style().montserrat_SemiBold(Colors.white, 18),));
  }

  Widget _dotPointText(String textLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _dotMission(),
        SizedBox(width: 12.0.w,),
        Flexible(
          child: Text(textLine, style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
        ),
      ],
    );
  }

  Widget _imageShow(String imagePath) {
    return Container(
      margin: EdgeInsets.all(15.0.h),
      width: MediaQuery.of(context).size.width,
      height: 250.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        image: DecorationImage(
            image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
    );
  }

  Widget _dotMission() {
    return Container(
      margin: EdgeInsets.only(top: 3.5.h),
      height:10.0.h,
      width: 10.0.w,
      decoration: BoxDecoration(
        color: Colors.amber[200].withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}
