// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/features/dashboard/models/starship_model.dart';
import 'package:starwars/features/dashboard/models/vehicles_model.dart';

class StarWarsService {
  Future<List<Character>> getCharacteres({int page = 1}) async {
    try {
      final response =
          await Dio().get('https://swapi.dev/api/people?page=$page');
      final results = response.data['results'];

      final List<Character> payload = [];

      for (var i = 0; i < results.length; i++) {
        payload.add(Character.fromJson(results[i]));
      }

      return payload;
    } catch (e, a) {
      print(e);
      print(a);
      return [];
    }
  }

  Future<String> getCharacterImage(int id) async {
    try {
      final response = await Dio()
          .get('https://akabab.github.io/starwars-api/api/id/$id.json');

      return response.data['image'];
    } catch (e) {
      return '';
    }
  }

  Future<List> getShipsAndVehicles(Character character) async {
    try {
      final List<Future<Response>> futures = [];

      for (final url in character.starships) {
        futures.add(Dio().get(url));
      }

      for (final url in character.vehicles) {
        futures.add(Dio().get(url));
      }

      final responses = await Future.wait(futures);

      final List<StarshipModel> ships = [];
      final List<VehiclesModel> vehicles = [];

      for (final response in responses) {
        final Map<String, dynamic> data = response.data;

        if (data.containsKey('MGLT')) {
          ships.add(StarshipModel.fromJson(data));
        } else {
          vehicles.add(VehiclesModel.fromJson(data));
        }
      }

      return [ships, vehicles];
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> reportSighting(Character character) async {
    try {
      await Dio().post('https://jsonplaceholder.typicode.com/posts', data: {
        "userId": character.getId(),
        "dateTime": DateTime.now().toIso8601String(),
        "character_name": character.name
      });
    } catch (e) {
      print(e);
    }
  }
}
