// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/features/dashboard/models/starship_model.dart';
import 'package:starwars/features/dashboard/models/vehicles_model.dart';
import 'package:starwars/features/dashboard/service/dashboard_service.dart';
import 'package:starwars/features/general_widgets/connection_modal/connection_modal.dart';
import 'package:starwars/utils/toast/toast.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(const DashboardState.init());

  Future<void> getCharacters() async {
    print('getCharacters');
    try {
      emit(state.copyWith(isLoading: true));
      final List<Character> characters =
          await StarWarsService().getCharacteres(page: state.page);

      emit(state.copyWith(
          characters: [...state.characters, ...characters],
          isLoading: false,
          page: state.page + 1));
    } catch (e, a) {
      print(e);
      print(a);
    }
  }

  Future<void> getShipsAndVehicles(Character character) async {
    try {
      emit(state.copyWith(isLoading: true));
      final List data = await StarWarsService().getShipsAndVehicles(character);

      emit(state.copyWith(
          starships: data[0], vehicles: data[1], isLoading: false));
    } catch (e) {
      print(e);
    }
  }

  Future<void> reportSighting(
      {required Character character, required BuildContext context}) async {
    if (characterIsReported(character.name)) return;

    if (state.conectionIsOpen == false) {
      final result = await showConnectionModal(context: context);

      if (result != true) return;
    }

    try {
      emit(state.copyWith(isLoadingReport: true));

      await StarWarsService().reportSighting(character);

      emit(state.copyWith(
          reportedCharacters: [...state.reportedCharacters, character.name]));

      toast(text: 'Reporte enviado con éxito', context: context);
      Navigator.pop(context);
    } catch (e) {
      print(e);
    } finally {
      emit(state.copyWith(isLoadingReport: false));
    }
  }

  Future<void> getMoreCharacters() async {
    if (state.isLoadingMore) return;
    try {
      emit(state.copyWith(isLoadingMore: true));
      final List<Character> characters =
          await StarWarsService().getCharacteres(page: state.page);

      emit(state.copyWith(
          characters: [...state.characters, ...characters],
          isLoadingMore: false,
          page: state.page + 1));
    } catch (e, a) {
      print(e);
      print(a);
    }
  }

  bool characterIsReported(String name) {
    return state.reportedCharacters.contains(name);
  }

  void togglConectionStatus() {
    emit(state.copyWith(conectionIsOpen: !state.conectionIsOpen));
  }
}
