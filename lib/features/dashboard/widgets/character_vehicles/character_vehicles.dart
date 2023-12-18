import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:skeletons/skeletons.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/utils/formatter/formatter_utils.dart';
import 'package:starwars/utils/theme/theme.dart';

class CharacterVehicles extends StatelessWidget {
  const CharacterVehicles({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;
    final cubit = context.watch<DashboardCubit>();

    return Container(
      width: 100.w,
      margin: EdgeInsets.only(top: 2.h),
      padding: EdgeInsets.only(left: 7.w, right: 7.w, top: 1.h, bottom: 2.h),
      decoration: BoxDecoration(
        color: colorPmy(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vehículos',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          if (cubit.state.isLoading)
            Container(
              margin: EdgeInsets.only(top: 2.h),
              child: SkeletonTheme(
                themeMode: ThemeMode.dark,
                child: SkeletonParagraph(
                  style: const SkeletonParagraphStyle(
                    padding: EdgeInsets.zero,
                  ),
                ),
              ),
            )
          else if (cubit.state.vehicles.isEmpty)
            Text(
              '${character.name} no tiene vehículos.',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 15.sp),
            )
          else
            for (final vehicle in cubit.state.vehicles)
              Container(
                width: 86.w,
                padding: EdgeInsets.symmetric(vertical: 1.h),
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.black, width: 3))),
                child: Text(
                  "${vehicle.name} | ${vehicle.maxAtmospheringSpeed} Kph | ${vehicle.vehicleClass.capitalize()}",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 15.sp),
                ),
              )
        ],
      ),
    );
  }
}
