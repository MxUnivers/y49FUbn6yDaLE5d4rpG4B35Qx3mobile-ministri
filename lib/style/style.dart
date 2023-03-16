import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


var  primaryColor = Colors.deepPurple;
var greenColors = Colors.green[900];
var amberColor = Colors.amber;
var  blackColor  =  Colors.black;
var blackLightColor =  Color(0xff808080);
var  whiteColor  =  Colors.white ;


buttonTextStyle(){
  return GoogleFonts.freckleFace(
    decoration : TextDecoration.none,
    letterSpacing: 1,
    fontSize: 16,
    color : whiteColor,
    fontWeight: FontWeight.w600
  );
}



titleTextStyle(){
  return GoogleFonts.freckleFace(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 20,
      color : blackColor,
      fontWeight: FontWeight.w600
  );
}



titlePrimaryTextStyle(){
  return GoogleFonts.freckleFace(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 20,
      color : primaryColor,
      fontWeight: FontWeight.w600
  );
}


LargeBlackTitleTextStyle(){
  return GoogleFonts.freckleFace(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 24,
      color : blackColor,
      fontWeight: FontWeight.w600
  );
}
subTitleTextStyle(){
  return GoogleFonts.poppins(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 14,
      color : blackLightColor,
      fontWeight: FontWeight.w500
  );
}
subTitleWhiteTextStyle(){
  return GoogleFonts.poppins(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 14,
      color : whiteColor,
      fontWeight: FontWeight.w500
  );
}

subTitleBlackTextStyle(){
  return GoogleFonts.poppins(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 14,
      color : blackColor,
      fontWeight: FontWeight.w500
  );
}

subTitlePrimaryTextStyle(){
  return GoogleFonts.poppins(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 14,
      color : primaryColor,
      fontWeight: FontWeight.w500
  );
}


subTitleBoldTextStyle(){
  return GoogleFonts.poppins(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 16,
      color : blackColor,
      fontWeight: FontWeight.w600
  );
}

descriptionBlackTextStyle(){
  return GoogleFonts.fredokaOne(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 14,
      color : blackColor,
      fontWeight: FontWeight.w500
  );
}


mediumTitleTextStyle(){
  return GoogleFonts.fredokaOne(
      decoration : TextDecoration.none,
      letterSpacing: 1,
      fontSize: 18,
      color : whiteColor,
      fontWeight: FontWeight.w400
  );
}


// size of padding
double containerRoundCorner =  30 ;