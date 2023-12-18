import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeletons/skeletons.dart';
import 'package:starwars/utils/theme/theme.dart';

class CharacterSkeletonLoading extends StatelessWidget {
  const CharacterSkeletonLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Stack(
          children: [
            SizedBox(
              width: 47.w,
              height: 50.w,
              child: SkeletonTheme(
                themeMode: ThemeMode.dark,
                child: SkeletonAvatar(
                  style: SkeletonAvatarStyle(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 47.w,
              height: 50.w,
              child: SkeletonTheme(
                  shimmerGradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 241, 205, 84),
                      colorPmy(context),
                      const Color.fromARGB(255, 218, 171, 16),
                      colorPmy(context),
                      const Color.fromARGB(255, 241, 205, 84),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 35.w,
                        child: SkeletonParagraph(
                          style: const SkeletonParagraphStyle(lines: 1),
                        ),
                      ),
                      SizedBox(
                        width: 25.w,
                        child: SkeletonParagraph(
                          style: const SkeletonParagraphStyle(lines: 1),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ));
  }
}
