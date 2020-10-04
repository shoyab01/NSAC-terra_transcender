import 'dart:async';
import 'dart:math';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:terra_transcender/home_directory/overview_directory/star.dart';
import 'package:url_launcher/url_launcher.dart';

class Overview extends StatefulWidget {
  @override
  _OverviewState createState() => _OverviewState();
}

class _OverviewState extends State<Overview> with TickerProviderStateMixin{

  AnimationController animationController;
  var random = Random();

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          animationController.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    animationController.forward();
  }

  List<Widget> makeStar(double width, double height) {
    double starsInRow = width / 50;
    double starsInColumn = height / 50;
    double starsNum = starsInRow != 0
        ? starsInRow * (starsInColumn != 0 ? starsInColumn : starsInRow)
        : starsInColumn;

    List<Widget> stars = [];

    for (int i = 0; i < starsNum; i++) {
      stars.add(Star(
        top: random.nextInt(height.floor()).toDouble(),
        right: random.nextInt(width.floor()).toDouble(),
        animationController: animationController,
      ));
    }

    return stars;
  }

  final String _urlOverview = "https://www.nasa.gov/johnson/HWHAP/the-overview-effect";
  final _overviewScaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(
    content: Text('This device is not connected to internet.'),
  );

  final _overViewPicList =
      [
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR55Tbke_iisnFimV5nDGuk_DGtlSJxGA_EZg&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQCwfKMHjCTs4kg-Yc0-A9FIPw0BrnW7JOGwQ&usqp=CAU",
        "data:image/jpeg;base64,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",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ6ZRQf6fULrjBvt9aMFD9dyjkjhEIrwhJbVQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcR4YkBTwWF9Zu-x8rS5a3Tlb9zDqUTCifZFKQ&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTFVKDVLUq8-Ty_EI0E2cpUOJ_fpHyofdp8Ig&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSJKA0nAVxL0X33M1PmBD7sSfYHRwbG2IuwNA&usqp=CAU",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTQRrPRH6WCzD7o1FhmpV-twkE9RQrI9D7O7g&usqp=CAU",
      ];

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (Timer t) => setAnimation());
    return Scaffold(
      key:_overviewScaffoldKey,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Font_Style.secondaryColor,
        elevation: 5.0,
        onPressed: () {
          Navigator.pushNamed(context, "moreoverview");
        },
        label: Row(
          children: <Widget>[
            Text(
              'More on Overview Effect',
              style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor.withOpacity(0.8), 14),
            ),
            Icon(
              Icons.arrow_forward,
              color: Font_Style.primaryColor.withOpacity(0.8),
              size: 18.0,
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, left: 14.0.w, right: 14.0.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24.0,
                            color: Colors.amber[600],
                          )),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: Text(
                          "Virtually Experience Overview Effect",
                          textAlign: TextAlign.center,
                          style: Font_Style()
                              .montserrat_SemiBold(Colors.amber[600], 24.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0.h,),
                  Container(
                    height: 240.0.h,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 240.0.h,
                          color: Color(0xFF020012),
                        ),
                        ...makeStar(MediaQuery
                            .of(context)
                            .size
                            .width, MediaQuery
                            .of(context)
                            .size
                            .height),
                        FlareActor(
                          "assets/WorldSpin.flr",
                          alignment: Alignment.center,
                          fit: BoxFit.scaleDown,
                          animation: "roll",
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0.h,),
                  Text("The Blue Marble (Our Earth)", style: Font_Style().montserrat_SemiBold_underline(Font_Style.secondaryColor.withOpacity(0.8), 16),),
                  SizedBox(height: 25.0.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Overview Effect", style: Font_Style().montserrat_Bold_underline(Font_Style.primaryLightColor.withOpacity(0.8), 20),)),
                  SizedBox(height: 15.0.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Font_Style.dot(),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: "The ", style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                              children: <TextSpan>[
                                TextSpan(text: "overview effect", style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400].withOpacity(0.8), 16.5)),
                                TextSpan(
                                  text: " is a cognitive shift in awareness reported by some astronauts during spaceflight, often while viewing the Earth from outer space.",
                                  style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  overviewImage(_overViewPicList[6]),
                  SizedBox(
                    height: 12.0.h,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Font_Style.dot(),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: 'The term and concept were coined in 1987 by ', style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                              children: <TextSpan>[
                                TextSpan(text: "Frank White", style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400].withOpacity(0.8), 16.5)),
                                TextSpan(
                                  text: ", who explored the theme in his book The Overview Effect — Space Exploration and Human Evolution (Houghton-Mifflin, 1987), (AIAA, 1998).",
                                  style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h,),
                  overviewImage(_overViewPicList[1]),
                  SizedBox(height: 12.0.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Font_Style.dot(),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: 'It is the experience of seeing firsthand the reality of the Earth in space, which is immediately understood to be a tiny, fragile ball of life, ', style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                              children: <TextSpan>[
                                TextSpan(text: '"hanging in the void"', style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400].withOpacity(0.8), 16.5)),
                                TextSpan(text: ", shielded and nourished by a paper-thin atmosphere. From space, national boundaries vanish, the conflicts that divide people become less important, and the need to create a planetary society with the united will to protect this", style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),),
                                TextSpan(text: '"pale blue dot" ', style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400].withOpacity(0.8), 16.5)),
                                TextSpan(
                                  text: " becomes both obvious and imperative.",
                                  style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16),
                                ),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Font_Style.dot(),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: RichText(
                          text: TextSpan(
                              text: 'Michael Collins — ', style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400].withOpacity(0.8), 16.5),
                              children: <TextSpan>[
                                TextSpan(text: "The thing that really surprised me was that it [Earth] projected an air of fragility. And why, I don’t know. I don’t know to this day. I had a feeling it’s tiny, it’s shiny, it’s beautiful, it’s home, and it’s fragile.", style: Font_Style().montserrat_medium(Font_Style.secondaryColor.withOpacity(0.8), 16)),
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0.h,),
                  Card(
                    elevation: 5.0,
                    color: Colors.white.withOpacity(0.9),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white70, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: InkWell(
                      onTap: () {
                        launchURL(_urlOverview);
                      },
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width - 70.0.w,
                            padding: EdgeInsets.only(left: 5.0.w, right: 5.0.w, top: 10.0.h, bottom: 10.0.h),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Also see this podcast of Frank White hosted by Gary Jordan on ', style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor.withOpacity(0.8), 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: "The Overview Effect.",
                                      style: Font_Style().montserrat_SemiBold_underline(Colors.lightBlueAccent[400], 16.5),
                                    ),
                                  ]
                              ),
                            ),
                          ),
                          Icon(Icons.arrow_forward, size: 27.0, color: Font_Style.primaryColor,),
                        ],
                      ),
                    ),
                  ),
                  overviewImage(_overViewPicList[0]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget overviewImage(String imageUrl) {
    return Container(
      margin: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
      height: 4 * MediaQuery.of(context).size.width / 7,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
        image: DecorationImage(
            image: AssetImage("assets/sunshinefromiss.jpg"), fit: BoxFit.cover),
      ),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true,
        enableDomStorage: true,
      );
    } else {
      _overviewScaffoldKey.currentState.showSnackBar(snackBar);
      //throw 'Could not launch $url';
    }
  }
}
