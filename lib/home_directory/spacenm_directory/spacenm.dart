import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';

class Spacenm extends StatefulWidget {
  @override
  _SpacenmState createState() => _SpacenmState();
}

class _SpacenmState extends State<Spacenm> {

  bool chand = false;
  bool nisar = false;
  bool nasaIsroTies = false;

  final textLineListChandrayan1 =
      [
        "This ISRO - NASA collaboration led to the discovery of water molecules on the lunar surface.",
        "It was launched on October 22, 2008. The mission was ended on August 28, 2009.",
        "It conducted the study of the chemical, mineralogical and photogeologic mapping of the Moon.",
        "Chandrayaan-1, the first Indian deep space mission, was launched to orbit the Moon and to dispatch an impactor to the surface.",
      ];

  final textLineListNisar =
      [
        "The NASA-ISRO SAR (NISAR) Mission will measure Earth’s changing ecosystems, dynamic surfaces, and ice masses providing information about biomass, natural hazards, sea level rise, and groundwater, and will support a host of other applications. NISAR will observe Earth’s land and ice-covered surfaces globally with 12-day regularity on ascending and descending passes, sampling Earth on average every 6 days for a baseline 3-year mission.",
        "On september 30, 2014, NASA and ISRO signed a partnership to collaborate on and launch NISAR. The mission is targeted to launch in early 2022.",
        "It is destined to make global measurements of the causes and consequences of land surface changes using advanced radar imaging.",
        "Role of the space agencies: NASA is providing the mission’s L-band synthetic aperture radar, a high-ratecommunication subsystem for science data, GPS receivers, a solid-state recorder and payload datasubsystem. ISRO is providing the spacecraft bus, the S-band radar, the launch vehicle and associated launch.",
        "It is the first satellite mission to use two different radar frequencies (L-band and S-band) to measure changes in our planet's surface less than a centimeter across.",
      ];

  final textLineListTies =
      [
        "OSCAT instrument on ISRO's OceanSat 2 spacecraft, launched in September 2009 showed winds of hurricane Irene (which hit North Carolina, USA) long before the landfall.",
        "Visible imagery from NASA’s Terra satellite revealed that strong wind shear was adversely affecting Subtropical Cyclone Joaninha in the Southern Indian Ocean.",
        "NASA found debris of the Vikram lander that lost contact moments before the touchdown as part of the Chandrayaan 2 mission on September 07, 2019.",
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: GestureDetector(
         onTap: () {
           Navigator.of(context).pop();
         },
         child: Icon(Icons.arrow_back_ios, size: 24.0,
           color: Colors.amber[600],),
       ),
        title: Text("Space Collabs", style: Font_Style().montserrat_SemiBold(Colors.amber[600], 24.0),),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 12.0.h, bottom: 12.0.h, left: 12.0.w, right: 12.0.w),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                        text: 'ISRO', style: Font_Style().montserrat_Bold(Colors.lightBlueAccent[400], 20),
                        children: <TextSpan>[
                          TextSpan(text: ' (Indian Space Research Organisation) ', style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400], 18)),
                          TextSpan(text: 'is ranked 5th in the world with a budget of more than 1.5 billion US Dollars and holds a record of launching the most satellites in a single mission.', style: Font_Style().montserrat_medium(Colors.white, 16)),
                        ]
                    ),
                  ),
                  SizedBox(height: 20.0.h,),
                  RichText(
                    text: TextSpan(
                      text: 'ISRO', style: Font_Style().montserrat_SemiBold(Colors.white, 16),
                      children: <TextSpan>[
                        TextSpan(text: ' collaborated with ', style: Font_Style().montserrat_medium(Colors.white, 16)),
                        TextSpan(text: 'NASA', style: Font_Style().montserrat_SemiBold(Colors.white, 16)),
                        TextSpan(text: ' in some of its space missions and ', style: Font_Style().montserrat_medium(Colors.white, 16)),
                        TextSpan(text: 'NASA', style: Font_Style().montserrat_SemiBold(Colors.white, 16)),
                        TextSpan(text: ' applauded India’s success in its space endeavours, saying the growing relationship with Indian Space Research Organisation ', style: Font_Style().montserrat_medium(Colors.white, 16)),
                        TextSpan(text: '(ISRO)', style: Font_Style().montserrat_SemiBold(Colors.white, 16)),
                        TextSpan(text: ' holds great future. ', style: Font_Style().montserrat_medium(Colors.white, 16)),
                      ]
                    ),
                  ),
                  SizedBox(height: 20.0.h,),
                  RichText(
                    text: TextSpan(
                        text: '“It is wonderful to see how the relationship between ', style: Font_Style().montserrat_medium(Colors.white, 16),
                        children: <TextSpan>[
                          TextSpan(text: 'NASA', style: Font_Style().montserrat_SemiBold(Colors.white, 16)),
                          TextSpan(text: ' and ', style: Font_Style().montserrat_medium(Colors.white, 16)),
                          TextSpan(text: 'ISRO', style: Font_Style().montserrat_SemiBold(Colors.white, 16)),
                          TextSpan(text: ' has grown and evolved, the agreements we have signed since this group last convened, and the great promise our relationship holds for the future." NASA Administrator', style: Font_Style().montserrat_medium(Colors.white, 16)),
                          TextSpan(text: ' Charles Bolden ', style: Font_Style().montserrat_SemiBold(Colors.lightBlueAccent[400], 16)),
                          TextSpan(text: ' said in his address to the fourth US-India Civil Space Joint Working Group meeting.', style: Font_Style().montserrat_medium(Colors.white, 16)),
                        ]
                    ),
                  ),
                  Font_Style.dividerSet(),
                  _title("NASA's collaboration with ISRO"),
                  SizedBox(height: 15.0.h,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        chand = !chand;
                      });
                    },
                    child: Card(
                        elevation: 5.0,
                        color: Colors.deepPurple.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h, left: 4.0.w, right: 4.0.w),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width - 80.0.w,
                                    child: Flexible(child: Text("Chandrayaan-1", textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 18),))),
                                Spacer(),
                                Icon(!chand ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: Colors.white.withOpacity(0.8), size: 36.0,),
                              ],
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 8.0.h,),
                  _dotPointText(textLineListChandrayan1[0]),
                  chand ? Container(
                    child: Column(
                      children: <Widget>[
                        _imageShow("assets/chandrayan1.png"),
                        _dotPointText(textLineListChandrayan1[1]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListChandrayan1[2]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListChandrayan1[3]),
                      ],
                    ),
                  ) : Container(),
                  Font_Style.dividerSet(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        nisar = !nisar;
                      });
                    },
                    child: Card(
                        elevation: 5.0,
                        color: Colors.deepPurple.withOpacity(0.7),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                            padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h, left: 4.0.w, right: 4.0.w),
                            child: Row(
                              children: <Widget>[
                                Container(
                                    width: MediaQuery.of(context).size.width - 80.0.w,
                                    child: Flexible(child: Text("NISAR (NASA ISRO Synthetic Aperture Radar)", textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 18),))),
                                Spacer(),
                                Icon(!nisar ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: Colors.white.withOpacity(0.8), size: 36.0,),
                              ],
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 8.0.h,),
                  _dotPointText(textLineListNisar[0]),
                  nisar ? Container(
                    child: Column(
                      children: <Widget>[
                        _imageShow("assets/nisar.jpg"),
                        _dotPointText(textLineListNisar[1]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListNisar[2]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListNisar[3]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListNisar[4]),
                      ],
                    ),
                  ) : Container(),
                  Font_Style.dividerSet(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        nasaIsroTies = !nasaIsroTies;
                      });
                    },
                    child: Card(
                      elevation: 5.0,
                      color: Colors.white.withOpacity(0.9),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                          padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h, left: 4.0.w, right: 4.0.w),
                          child: Row(
                            children: <Widget>[
                              Container(
                                  width: MediaQuery.of(context).size.width - 80.0.w,
                                  child: Flexible(child: Text("Interesting Instances of NASA - ISRO ties", textAlign: TextAlign.center, overflow: TextOverflow.clip, textDirection: TextDirection.ltr, style: Font_Style().montserrat_Bold(Font_Style.primaryColor, 22),))
                              ),
                              Icon(!nasaIsroTies ? Icons.arrow_drop_down : Icons.arrow_drop_up, color: Font_Style.primaryColor, size: 36.0,),
                            ],
                          )),
                    ),
                  ),
                  SizedBox(height: 15.0.h,),
                  nasaIsroTies ? Container(
                    child: Column(
                      children: <Widget>[
                        _dotPointText(textLineListTies[0]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListTies[1]),
                        SizedBox(height: 12.0.h,),
                        _dotPointText(textLineListTies[2]),
                      ],
                    ),
                  ) : Container(),
                  _imageShow("assets/isro_nasa_isro.jpeg"),
                ],
              )
          ),
        ),
      ),
    );
  }

  Widget _title(String title) {
    return Card(
      elevation: 5.0,
      color: Colors.white.withOpacity(0.9),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
          padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h, left: 4.0.w, right: 4.0.w),
          child: Text(title, textAlign: TextAlign.center, overflow: TextOverflow.clip, textDirection: TextDirection.ltr, style: Font_Style().montserrat_Bold(Font_Style.primaryColor, 22),)),
    );
  }

  Widget _subTitle(String subTitle) {
    return Card(
        elevation: 5.0,
        color: Colors.deepPurple.withOpacity(0.7),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
            padding: EdgeInsets.only(top: 6.0.h, bottom: 6.0.h, left: 4.0.w, right: 4.0.w),
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width - 80.0.w,
                    child: Flexible(child: Text(subTitle, textDirection: TextDirection.ltr, textAlign: TextAlign.left, style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 18),))),
                Spacer(),
                Icon(Icons.arrow_drop_down, color: Colors.white.withOpacity(0.8), size: 36.0,),
              ],
            )
        )
    );
  }

  Widget _dotPointText(String textLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Font_Style.dot(),
        SizedBox(width: 12.0.w,),
        Flexible(
          child: Text(textLine, style: Font_Style().montserrat_medium(Colors.white, 16),),
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
}
