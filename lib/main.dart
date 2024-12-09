import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/utils/bloc/bloc_utis.dart';
import 'package:starwars/utils/routes/routes_enum.dart';
import 'package:starwars/utils/routes/routes_utils.dart';
import 'package:starwars/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MultiBlocProvider(
        providers: getCubits(),
        child: ResponsiveSizer(
          builder: (context, orientation, screenType) {
            return MaterialApp(
              title: 'Star Wars Invasion',
              theme: ThemeConfig().getTheme(),
              routes: getRoutes(),
              initialRoute: RoutesList.splash,
              debugShowCheckedModeBanner: false,
            );
          },
        ),
      ),
    );
  }
}
