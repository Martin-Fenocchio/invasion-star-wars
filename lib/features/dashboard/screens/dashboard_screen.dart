import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/cubit/dashboard_cubit.dart';
import 'package:starwars/features/dashboard/widgets/character/character.dart';
import 'package:starwars/features/dashboard/widgets/character_skeleton_loading/character_skeleton_loading.dart';
import 'package:starwars/features/dashboard/widgets/navbar/navbar.dart';
import 'package:starwars/features/general_widgets/connection_modal/connection_modal.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(detectScroll);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void detectScroll() {
    if (scrollController.position.pixels /
            scrollController.position.maxScrollExtent >
        0.8) {
      context.read<DashboardCubit>().getMoreCharacters();
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<DashboardCubit>();
    final characters = cubit.state.characters;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Navbar(),
          Padding(
            padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 3.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '¿A que malvado invasor has visto? repórtalo!',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () => showConnectionModal(
                          context: context,
                        ),
                    child: SvgPicture.asset('assets/images/settings.svg'))
              ],
            ),
          ),
          Container(
            height: 76.h,
            margin: EdgeInsets.only(left: 2.w, right: 2.w, top: 3.h),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            child: GridView(
              controller: scrollController,
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 20 / 22,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8),
              children: [
                if (cubit.state.isLoading)
                  for (var i = 0; i < 12; i++) const CharacterSkeletonLoading()
                else
                  for (final character in characters)
                    CharacterWidget(character: character),
                if (cubit.state.isLoadingMore)
                  for (var i = 0; i < 12; i++) const CharacterSkeletonLoading()
              ],
            ),
          )
        ],
      ),
    );
  }
}
