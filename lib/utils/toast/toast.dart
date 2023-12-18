import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void toast({required BuildContext context, required String text}) {
  showToastWidget(
    MediaQuery(
      data: const MediaQueryData(),
      child: SizedBox(
        width: 92.w,
        child: NeonContainer(
          width: 86.w,
          height: 7.h,
          containerColor: Colors.transparent,
          borderColor: Colors.green,
          spreadColor: Colors.green,
          child: Center(
            child: Text(text,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    ),
    position: ToastPosition.bottom,
  );
}
