import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/utils/theme/theme.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorPmy(context),
      ),
      height: 14.h,
      padding: EdgeInsets.only(bottom: 2.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'reporte de invasión',
            style: TextStyle(
                fontFamily: 'STJEDISE', color: Colors.black, fontSize: 20.sp),
          )
        ],
      ),
    );
  }
}
