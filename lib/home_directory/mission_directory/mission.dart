import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class Mission extends StatefulWidget {
  @override
  _MissionState createState() => _MissionState();
}

class _MissionState extends State<Mission> {

  final String _urlWomen1 = "https://www.nasa.gov/women";
  final String _urlWomen2 = "https://www.nasa.gov/stem/womenstem.html";

  final _missionScaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar=SnackBar(
    content: Text('This device is not connected to internet.'),
  );
  
  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      _missionScaffoldKey.currentState.showSnackBar(snackBar);
      //throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key:_missionScaffoldKey,
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
                        child: Text("Racism", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
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
                    Text("Till today there are over 20 black astronauts", style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 17),),
                    SizedBox(height: 15.0.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Lessons from NASA - 1", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("NASA in August,2020 announced that it would stop the use of racist nicknames for comic objects."),
                    SizedBox(height: 12.0.h,),
                    Text("Names like ‘Eskimo Nebula’ and ‘Siamese twin galaxies’ are said to change.", style: Font_Style().montserrat_SemiBold(Colors.amber[200].withOpacity(0.8), 16.5),),
                    SizedBox(height: 12.0.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _dotMission(),
                        SizedBox(width: 12.0.w,),
                        Flexible(
                          child: RichText(
                            text: TextSpan(
                                text: 'Jeanette Epps', style: Font_Style().montserrat_SemiBold(Colors.amber[200].withOpacity(0.9), 16.5),
                                children: <TextSpan>[
                                  TextSpan(text: ' is set to become the first black woman astronaut to join the crew aboard the International Space Station.', style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.9), 16.5)),
                                ]
                            ),
                          ),
                        ),
                      ],
                    ),
                    Font_Style.dividerSet(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Ethnic Inequality & Casteism", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 15.0.h,),
                    Text("Every country has a few groups that are perpetually kept backward and discriminated against due to their differences. They could also be minorities.", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
                    SizedBox(height: 12.0.h,),
                    Text(
                        "A space crew consists of diverse members- pilots, "
                            "doctors, biologists, engineers, "
                            "chemists, physicists, teachers and so on. "
                            "The reason is because a space mission requires "
                            "diversity and variety of skill-sets for it to be successful.  "
                            "Applying this to life back on Earth, the rich diversity in "
                            "backgrounds and culture and differences of opinions is what drives "
                            "innovation and creativity that is essential for "
                            "humanity’s progress. By keeping a whole community "
                            "out of reach from science education and modern societies "
                            "we are missing out on variety, beauty and novelty.", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
                    SizedBox(height: 12.0.h,),
                    Font_Style.dividerSet(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Political Inequality", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 15.0.h,),
                    Text("This is prevalent in several countries , both democratic and non-democratic. It is also found in various institutional structures in the form of hierarchy with the more influential holding more power.", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
                    SizedBox(height: 12.0.h,),
                    Text("It deprives people of their fundamental rights- to choose their representatives, and could be the biggest factor underlying all other inequalities.", style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 16),),
                    SizedBox(height: 15.0.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Lessons from NASA - 2", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("Voting in space has been possible since 1997 when a bill passed to legally allow voting from space in Texas. Since then, several NASA astronauts have exercised this civic duty from orbit. As NASA works toward sending astronauts to the Moon in 2024 and eventually on to Mars, the agency plans to continue to ensure astronauts who want to vote in space are able to, no matter where in the solar system they may be."),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("Four NASA astronauts are said to vote from space this year."),
                    Font_Style.dividerSet(),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Gender Inequality", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 12.0.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Lessons from NASA - 3", style: Font_Style().montserrat_Bold_underline(Colors.amber[200].withOpacity(0.8), 22),)),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("NASA has been including more women in STEM fields over the years."),
                    SizedBox(height: 12.0.h,),
                    _dotPointText("To watch more on how NASA includes women in space missions, click on below links :"),
                    SizedBox(height: 12.0.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            launchURL(_urlWomen1);
                          },
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.0.w),
                                child: Text("Women at NASA", style: Font_Style().montserrat_Regular_Underline(Colors.amber[200], 15),)))),
                    SizedBox(height: 12.0.h,),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            launchURL(_urlWomen2);
                          },
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.0.w),
                                child: Text("Women of STEM (Science, Technology, Engineering and Mathematics)", style: Font_Style().montserrat_Regular_Underline(Colors.amber[200], 15),)))),
                    SizedBox(height: 12.0.h,),
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
        color: Colors.white.withOpacity(0.8),
        shape: BoxShape.circle,
      ),
    );
  }
}
