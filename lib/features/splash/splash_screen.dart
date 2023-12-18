import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/utils/routes/routes_enum.dart';
import 'package:starwars/utils/theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      unawaited(context.read<DashboardCubit>().getCharacters());

      Future.delayed(const Duration(seconds: 2), () {
        setUISystemColor(color: colorPmy(context), onlyTop: true);

        Navigator.pushNamedAndRemoveUntil(
            context, RoutesList.dashboard, (route) => false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Animate(
              effects: const [
                FadeEffect(duration: Duration(milliseconds: 1500)),
              ],
              child: SizedBox(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text('invasión',
                            style: TextStyle(
                                fontFamily: 'STJEDISE',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 32.sp)),
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/images/starwarslogo.svg',
                      width: 70.w,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 3.h),
                        alignment: Alignment.bottomCenter,
                        child: Text('by martín fenocchio',
                            style: TextStyle(
                                fontFamily: 'STJEDISE',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp)),
                      ),
                    ),

                    /*  SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      'Pokédex',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 27.sp),
                    ) */
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
