import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

bool _canBeDragged;

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{

  AnimationController animationController;
  final double maxSlide = 225.0;

  final _homeScaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(
    content: Text('This device is not connected to internet.'),
  );

  String greet;
  String background;

  @override
  void initState() {
    greet = greeting();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    super.initState();
  }

  void toggle() => animationController.isDismissed
      ? animationController.forward()
      : animationController.reverse();

  void _onDragStart(DragStartDetails details) {
    double minDragStartEdge = 0;
    double maxDragStartEdge = MediaQuery.of(context).size.width;
    bool isDragOpenFromLeft = animationController.isDismissed && details.globalPosition.dx > minDragStartEdge;
    bool isDragCloseFromRight = animationController.isCompleted && details.globalPosition.dx < maxDragStartEdge;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if(_canBeDragged) {
      double delta = details.primaryDelta / maxSlide;
      animationController.value -= delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if(animationController.isDismissed || animationController.isCompleted)
      return;
    if(details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx / MediaQuery.of(context).size.width;

      animationController.fling(velocity: visualVelocity);
    } else if(animationController.value < 0.5) {
      animationController.reverse();
    } else {
      animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {

    var _homeScreen = KeyboardAvoider(
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
            Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 80.0.w,
                  child: Text(
                      "Good ${greet}",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.fade,
                      style: Font_Style()
                          .montserrat_Bold(Colors.white, 27.0)),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      toggle();
                    },
                    child: Icon(Icons.menu, color: Colors.white, size: 27.0,)),
              ],
            ),
            Spacer(flex: 3,),
            _homeItemCard("SAPIENS IN SPACE", "Know about your astronauts", "astronauts"),
            Spacer(flex: 2,),
            _homeItemCard("EARTH FROM SPACE", "Experience  overview effect virtually", "overview"),
            Spacer(flex: 2,),
            _homeItemCard("MISSION INTEGRITY", "Applying the essence of Space Missions in human societies", "mission"),
            Spacer(flex: 2,),
            _homeItemCard("SPACE NEAR ME", "Discover space collabs with your local agencies", "spacenm"),
            Spacer(flex: 3,),
          ],
        ),
      ),
    );

    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
        key: _homeScaffoldKey,
        body: SafeArea(
          child: GestureDetector(
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            child: AnimatedBuilder(
              animation: animationController,
              builder: (context, _) {
                double slide = -maxSlide * animationController.value;
                double scale = 1 - (animationController.value * 0.3);
                return Stack(
                  children: <Widget>[
                  KeyboardAvoider(
                    autoScroll: true,
                      child: GestureDetector(
                        onTap: () {
                          toggle();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.height,
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 2, right: 12.0.w, top: 12.0.h, bottom: 12.0.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15.0)),
                            image: DecorationImage(
                                image: AssetImage("assets/menuback.jpg"), fit: BoxFit.cover),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              _menuItem("External Links", Icons.link),
                              SizedBox(height: 12.0.h,),
                              _menuItem("Collaborators", Icons.people),
                              SizedBox(height: 12.0.h,),
                              _menuItem("GitHub Link", Icons.link),
                              SizedBox(height: 12.0.h,),
                              _menuItem("Contact Us", Icons.contact_mail)
                            ],
                          ),
                        ),
                      ),
                  ),

                    Transform(
                        transform: Matrix4.identity()
                          ..translate(slide)
                          ..scale(scale),
                        alignment: Alignment.centerRight,
                        child: _homeScreen,
                    ),
                  ],
                );
              },
            ),
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
      _homeScaffoldKey.currentState.showSnackBar(snackBar);
      //throw 'Could not launch $url';
    }
  }
  
  Widget _menuItem(String title, IconData iconData) {
    return InkWell(
      onTap: () {
        //toggle();
        switch(title){
          case "External Links":
            Navigator.of(context).pushNamed("external_links");
            break;
          case "Collaborators":
            Navigator.of(context).pushNamed("collab");
            break;
          case "GitHub Link":
            launchURL("https://github.com/shoyab01/NSAC-terra_transcender");
            break;
          case "Contact Us":
            Navigator.of(context).pushNamed("contact_us");
            break;
            
          default:

            break;
        }
      },
      child: Card(
        elevation: 5.0,
        color: Colors.white.withOpacity(0.8 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),),
        child: Container(
          padding: EdgeInsets.only(top: 7.0.h, bottom: 7.0.h, left: 4.0.w, right: 4.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(iconData, size: 24.0, color: Font_Style.primaryColor,),
              SizedBox(width: 18.0.w,),
              Flexible(child: Text(title, style: Font_Style().montserrat_medium(Font_Style.primaryColor, 16),)),
            ],
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
