import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';

class Collab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.8), size: 24.0,)),
        title: Text("Collaborators", style: Font_Style().montserrat_SemiBold(Colors.white.withOpacity(0.8), 24.0),),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 12.0.w, right: 12.0.w, top: 12.0.h, bottom: 12.0.h),
          child: Column(
            children: <Widget>[
              Spacer(flex: 2,),
              _collabItem(context, "Shaik Shoyab Azmal (https://github.com/shoyab01/)"),
              Spacer(flex: 1,),
              _collabItem(context, "Harsha Vardhan Bathala (https://github.com/harsha01bathala)"),
              Spacer(flex: 1,),
              _collabItem(context, "Pranay Kowsyap (https://github.com/kowsyap)"),
              Spacer(flex: 1,),
              _collabItem(context, "Sai Suraj Karra (https://github.com/saisurajkarra)"),
              Spacer(flex: 1,),
              _collabItem(context, "Adithi Ashoka (https://github.com/adithiashoka)"),
              Spacer(flex: 1,),
              _collabItem(context, "Vijay Bhusare (https://github.com/vijaybhusare92)"),
              Spacer(flex: 4,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _collabItem(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.0.h, horizontal: 5.0.w),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 5.0.w,
      decoration: BoxDecoration(
          border: Border.all(
            color: Font_Style.secondaryColor,
          ),
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Font_Style.secondaryColor.withOpacity(0.8)
      ),
      child: Text(title, textDirection: TextDirection.ltr, textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor.withOpacity(0.8), 16),),
    );
  }
}
