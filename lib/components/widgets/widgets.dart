import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
myContainerAppBar(String title){
  return Container(
      height: 0.07.sh,
       alignment: Alignment.center,
      child:Text(title,
      textAlign: TextAlign.center,style:GoogleFonts.elMessiri(
      fontWeight: FontWeight.w700,
      fontSize: 17.ssp,
      color: Colors.white,))
  );
}

//******************************************************
myAppBar(String title){
  return AppBar(
       elevation: 0,
      centerTitle: true,
      title:Text(title,
          textAlign: TextAlign.center,style:GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700,
        fontSize: 19.ssp,
        color: Colors.white,
      ))
   );
}

//******************************************************
SpinKitWave spinKit(BuildContext context) {
  return SpinKitWave(
    color: Colors.pinkAccent,
    size: 50.0,
  );
}

String timeText(DateTime dateTime){
  return dateTime.day.toString()+"-"+dateTime.month.toString()+"-"+dateTime.year.toString();
}

//**************************************