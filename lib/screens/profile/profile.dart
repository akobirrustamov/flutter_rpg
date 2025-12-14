import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const StyledTitle("Shogird ")),
      body:  SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Container(
               padding: EdgeInsets.all(16),
               color: Color.fromRGBO(45, 45, 45, 0.3),
               child: Row(
                children: [
                  Image.asset("assets/img/vocations/${character.vocation.image}",
                    width: 140,
                    height: 140,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StyledHeading(character.vocation.title),
                        StyledText(character.vocation.description)
                      ],
                    )
                  )
                ],
               ),
             ),

             SizedBox(height:20),
             Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
             Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                color: Color.fromRGBO(45, 45, 45, 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const StyledHeading("Slogan"),
                    StyledText(character.slogan),
                    SizedBox(height:20),
                    const StyledHeading("Weapon"),
                    StyledText(character.)
                  ],
                ),
              ),
              
             )

          ],
        ),
      ),
    );
  }
}
