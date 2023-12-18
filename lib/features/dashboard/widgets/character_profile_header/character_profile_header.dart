import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/utils/characters/characters_images.dart';
import 'package:starwars/utils/theme/theme.dart';

class CharacterProfileHeader extends StatelessWidget {
  const CharacterProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;

    return Stack(
      children: [
        Opacity(
          opacity: 0.5,
          child: Container(
            width: 100.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(charactersImages[character.name] ?? ''),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        Positioned(
            left: 3.h,
            bottom: 3.h,
            child: Text(
              character.name,
              style: TextStyle(
                  fontSize: 26.sp,
                  color: colorPmy(context),
                  fontWeight: FontWeight.bold),
            )),
        Positioned(
          top: 10.w,
          left: 3.w,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: SvgPicture.asset(
              'assets/images/arrow_left.svg',
              width: 10.w,
              height: 10.w,
            ),
          ),
        )
      ],
    );
  }
}
