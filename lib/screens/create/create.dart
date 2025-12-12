import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class Create extends StatefulWidget {
  const Create({super.key});

  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      print("name is empty");
      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      print("name is empty");
      return;
    }
    
    print(_nameController.text);
    print(_sloganController.text);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const StyledTitle("Create Shogird"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          children: [

            // welcome
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("Welcome, new Shogird")),
            const Center(
              child: StyledText(
                "Create, a name & new slogan for your shogird.",
              ),
            ),
            const SizedBox(height: 30),


            // input name & slogan
            TextField(
              controller: _nameController,
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_2),
                label: StyledText("Shogird name"),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sloganController,
              style: GoogleFonts.kanit(
                textStyle: Theme.of(context).textTheme.bodyMedium,
              ),
              cursorColor: AppColors.textColor,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.chat),
                label: StyledText("shogird slogan"),
              ),
            ),
            SizedBox(height: 30),


            // select vocation title 
            Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
            const Center(child: StyledHeading("Choose name vocation")),
            const Center(
              child: StyledText(
                "This determins your available skills",
              ),
            ),
            const SizedBox(height: 30),


            // vocation cards
            const VocationCard(
              vocation: Vocation.junkie
            ),
            const VocationCard(
              vocation: Vocation.ninja
            ),
            const VocationCard(
              vocation: Vocation.raider
            ),
            const VocationCard(
              vocation: Vocation.wizard
            ),

            Center(
              child: StyledButton(
                onPressed: handleSubmit,
                child: StyledHeading("Create shogird"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
