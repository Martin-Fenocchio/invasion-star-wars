import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:light_modal_bottom_sheet/light_modal_bottom_sheet.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/utils/theme/theme.dart';

class ConnectionModal extends StatelessWidget {
  const ConnectionModal({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();
    final Map configs = {
      'isOn': {'color': Colors.red, 'text': 'Apagar conexión'},
      'isOff': {'color': Colors.green, 'text': 'Encender conexión'}
    };

    final bool connectionIsOpen = cubit.state.conectionIsOpen;
    Map config = connectionIsOpen ? configs['isOn'] : configs['isOff'];

    return Container(
      padding: EdgeInsets.only(top: 5.h),
      decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              'assets/images/ilustration.jpg',
              width: 80.w,
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 3.h, bottom: 2.h),
            child: Text(
              'alerta',
              style: TextStyle(
                  fontFamily: 'STJEDISE',
                  fontSize: 25.sp,
                  color: colorPmy(context),
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 80.w,
            child: Text(
              'Tu conexión esta ${connectionIsOpen ? 'activada' : 'desactivada'}, Si activas la conexión, podrás reportar avistajes, pero también estarás expuesto a los invasores!, ¿estás seguro de querer ${connectionIsOpen ? "desconectarte" : "conectarte"}?',
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          GestureDetector(
            onTap: () {
              cubit.togglConectionStatus();
              Navigator.pop(context, true);
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 7.w, vertical: 6.h),
              child: NeonContainer(
                width: 86.w,
                height: 7.h,
                borderColor: config['color'] as Color,
                spreadColor: config['color'] as Color,
                child: Center(
                  child: Text(config['text'].toUpperCase(),
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: config['color'] as Color,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<dynamic> showConnectionModal({
  required BuildContext context,
}) async {
  return showMaterialModalBottomSheet(
    backgroundColor: Colors.transparent,
    isDismissible: true,
    useRootNavigator: true,
    context: context,
    builder: (context) => SizedBox(
      width: 100.w,
      child: const ConnectionModal(),
    ),
  );
}
