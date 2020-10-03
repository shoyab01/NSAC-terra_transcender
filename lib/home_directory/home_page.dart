import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String greet;
  String background;

  @override
  void initState() {
    setState(() {
      greet = greeting();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: KeyboardAvoider(
            autoScroll: true,
            child: Container(
              padding: EdgeInsets.only(top: 25.0.h, bottom: 80.0.h, left: 15.0.w, right: 15.0.w),
              height: MediaQuery.of(context).size.height - 50.0.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(background), fit: BoxFit.cover)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      "Good ${greet}",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      style: Font_Style()
                          .montserrat_Bold(Colors.white, 27.0)),
                  Spacer(flex: 3,),
                  _homeItemCard("SAPIENS IN SPACE", "Know about your astronauts", "astronauts"),
                  Spacer(flex: 2,),
                  _homeItemCard("EARTH FROM SPACE", "Experience  overview effect virtually", "overview"),
                  Spacer(flex: 2,),
                  _homeItemCard("MISSION", "Learn about what makes a space mission possible", "mission"),
                  Spacer(flex: 2,),
                  _homeItemCard("SPACE NEAR ME", "Discover space collabs with your local agencies", "spacenm"),
                  Spacer(flex: 3,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      background = "assets/morning.jpg";
      return 'Morning';
    } else if (hour >= 12 && hour < 17) {
      background = "assets/afternoon.jpg";
      return 'Afternoon';
    } else if (hour >= 17 && hour < 19) {
      background = "assets/eve.jpeg";
      return 'Evening';
    } else if (hour >= 19 && hour < 24) {
      background = "assets/nightsky.jpeg";
      return 'Night';
    }
    return 'Morning';
  }

  Widget _homeItemCard(String title, String info, String route) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Center(
        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Font_Style.primaryColor.withOpacity(0.5),
          child: Container(
            height: 140.0.h,
            padding: EdgeInsets.only(
                left: 14.w, top: 10.h, bottom: 10.h, right: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Spacer(flex: 2,),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style:
                  Font_Style().montserrat_Bold(Colors.white, 20.0),
                ),
                Spacer(flex: 1,),
                Text(
                  info,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.fade,
                  style: Font_Style().montserrat_medium(Colors.white, 16),
                ),
                Spacer(flex: 1,),
                Container(
                  alignment: Alignment(1, 1),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
