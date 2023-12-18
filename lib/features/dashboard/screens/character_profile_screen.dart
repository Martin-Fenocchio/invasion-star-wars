import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:starwars/features/dashboard/models/character_model.dart';
import 'package:starwars/features/dashboard/widgets/character_data_item/character_data_item.dart';
import 'package:starwars/features/dashboard/widgets/character_profile_header/character_profile_header.dart';
import 'package:starwars/features/dashboard/widgets/character_starships/character_starships.dart';
import 'package:starwars/features/dashboard/widgets/character_vehicles/character_vehicles.dart';
import 'package:starwars/features/dashboard/widgets/report_button/report_button.dart';
import 'package:starwars/utils/theme/theme.dart';

class CharacterProfileScreen extends StatelessWidget {
  const CharacterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final character = ModalRoute.of(context)?.settings.arguments as Character;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CharacterProfileHeader(),
            SizedBox(
              height: 3.h,
            ),
            CharacterDataItem(
                label: 'Fecha De Nacimiento', value: character.birthYear),
            CharacterDataItem(
                label: 'Género', value: character.gender.getName()),
            CharacterDataItem(
              label: 'Color De Ojos',
              value: character.eyeColor,
              color: eyeColors[character.eyeColor],
            ),
            CharacterDataItem(
              label: 'Color De Pelo',
              value: character.hairColor,
            ),
            CharacterDataItem(label: 'Peso', value: "${character.mass} kg"),
            const CharacterVehicles(),
            const CharacterStarships(),
            const ReportButton(),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
