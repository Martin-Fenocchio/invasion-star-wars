import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/utils/formatter/formatter_utils.dart';

class CharacterDataItem extends StatelessWidget {
  const CharacterDataItem(
      {super.key, required this.label, required this.value, this.color});
  final String label, value;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.h),
      child: Row(
        children: [
          Text('$label: ',
              style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.bold)),
          Text("${value.capitalize()}.",
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              )),
          if (color != null)
            Container(
              margin: EdgeInsets.only(left: 4.w),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(5)),
              width: 10.w,
              height: 2.5.h,
            )
        ],
      ),
    );
  }
}
