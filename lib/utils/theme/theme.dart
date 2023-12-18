import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ThemeConfig {
  ThemeData getTheme() {
    const Color colorText = Color(0xff1D1D1D);
    const Color primary = Color(0xffdba90c);

    final ThemeData getTheme = ThemeData(
      appBarTheme: const AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: primary,
          systemNavigationBarIconBrightness: Brightness.light,
          statusBarColor: primary,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: primary,
      ),
      fontFamily: 'Open_Sans',
      textTheme: const TextTheme(
        bodyMedium: TextStyle(color: colorText, fontWeight: FontWeight.w300),
      ),
      colorScheme: const ColorScheme.light(
        primary: primary,
      ),
    );

    return getTheme;
  }
}

Color greyTextColor = const Color(0xffA3A3A3);

Color Function(BuildContext) colorPmy =
    (BuildContext context) => Theme.of(context).colorScheme.primary;

double fontSizeParg = 18;

TextStyle Function(BuildContext, {bool useColorTry}) styleHeadSection =
    (BuildContext context, {bool useColorTry = false}) => TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 5.w,
        );
TextStyle Function(BuildContext) styleTitleSection = (
  BuildContext context,
) =>
    const TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.w500,
    );

TextStyle Function(BuildContext, {bool useColorTry}) styleSubHead =
    (BuildContext context, {bool useColorTry = false}) => TextStyle(
          color: colorPmy(context),
          fontWeight: FontWeight.w700,
          fontFamily: 'Urbanist',
          fontSize: 4.w,
        );

TextStyle Function(BuildContext) styleParag = (context) => TextStyle(
      color: greyTextColor,
      fontSize: fontSizeParg,
    );

Future<void> setUISystemColor({
  required Color color,
  bool onlyTop = false,
  Color? colorBottom,
  bool animate = true,
}) async {
  print('a');
  await FlutterStatusbarcolor.setStatusBarColor(color, animate: animate);
  print('b');

  if (useWhiteForeground(color)) {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  } else {
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    //await FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
  }

  print('c');
  if (onlyTop) return;
  print('d');

  await FlutterStatusbarcolor.setNavigationBarColor(
    colorBottom ?? color,
    animate: animate,
  );

  if (useWhiteForeground(colorBottom ?? color)) {
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  } else {
    await FlutterStatusbarcolor.setNavigationBarWhiteForeground(false);
  }
}

Map<String, Color> eyeColors = {
  "red": const Color(0xffFF0000),
  "green": const Color(0xff008000),
  "blue": const Color.fromARGB(255, 70, 141, 247),
  "yellow": const Color(0xffFFFF00),
  "orange": const Color(0xffFFA500),
  "pink": const Color(0xffFFC0CB),
  "purple": const Color(0xff800080),
  "brown": const Color.fromARGB(255, 80, 64, 64),
  "gray": const Color(0xff808080),
  "blue-gray": const Color(0xff92a7ff),
  "black": const Color(0xff000000),
  "white": const Color(0xffFFFFFF),
  "cyan": const Color(0xff00FFFF),
  "violet": const Color(0xff8A2BE2),
  "dark green": const Color(0xff006400),
  "turquoise": const Color(0xff40E0D0),
  "silver": const Color(0xffC0C0C0),
  "gold": const Color(0xffFFD700),
  "dark gray": const Color(0xff555555),
  "navy blue": const Color(0xff000080),
  "lime green": const Color(0xff00FF00),
};
