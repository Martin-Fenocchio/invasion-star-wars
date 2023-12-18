import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/utils/theme/theme.dart';

class ReportButton extends StatelessWidget {
  const ReportButton({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;
    final cubit = context.watch<DashboardCubit>();
    final bool isLoading = cubit.state.isLoadingReport || false;

    final Map configs = {
      'isNotReported': {'color': Colors.red, 'text': 'REPORTAR AVISAJE'},
      'isLoading': {'color': colorPmy(context), 'text': 'REPORTANDO...'},
      'isReported': {'color': Colors.green, 'text': 'REPORTADO'}
    };

    Map config = configs['isNotReported'];

    if (isLoading) {
      config = configs['isLoading'];
    } else if (cubit.characterIsReported(character.name)) {
      config = configs['isReported'];
    }

    return GestureDetector(
      onTap: () => cubit.reportSighting(character: character, context: context),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
        child: NeonContainer(
          width: 86.w,
          height: 7.h,
          borderColor: config['color'] as Color,
          spreadColor: config['color'] as Color,
          child: Center(
            child: Text(config['text'] as String,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: config['color'] as Color,
                    fontWeight: FontWeight.bold)),
          ),
        ),
      ),
    );
  }
}
