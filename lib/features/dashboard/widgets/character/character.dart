import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/utils/characters/characters_images.dart';
import 'package:starwars/utils/routes/routes_enum.dart';
import 'package:starwars/utils/theme/theme.dart';

class CharacterWidget extends StatelessWidget {
  const CharacterWidget({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();

    return GestureDetector(
      onTap: () {
        cubit.getShipsAndVehicles(character);
        Navigator.pushNamed(context, RoutesList.profile, arguments: character);
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              backgroundImage(charactersImages[character.name] ?? ''),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: cubit.characterIsReported(character.name)
                      ? Colors.green.withOpacity(0.8)
                      : Colors.black.withOpacity(0.6),
                ),
              ),
              Container(
                width: 47.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      character.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 19.sp,
                          color: colorPmy(context),
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      character.gender.getName(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget backgroundImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(url, fit: BoxFit.cover, width: 47.w, height: 52.w,
          errorBuilder: (context, error, stackTrace) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/images/stars.jpg',
            fit: BoxFit.cover,
            width: 47.w,
            height: 52.w,
          ),
        );
      }, loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            'assets/images/stars.jpg',
            fit: BoxFit.cover,
            width: 47.w,
            height: 52.w,
          ),
        );
      }),
    );
  }
}
