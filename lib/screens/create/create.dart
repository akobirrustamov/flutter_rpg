import 'package:flutter/material.dart';
import 'package:flutter_rpg/model/character.dart';
import 'package:flutter_rpg/model/vocation.dart';
import 'package:flutter_rpg/screens/create/vocation_card.dart';
import 'package:flutter_rpg/screens/home/home.dart';
import 'package:flutter_rpg/services/character_store.dart';
import 'package:flutter_rpg/shared/styled_button.dart';
import 'package:flutter_rpg/shared/styled_text.dart';
import 'package:flutter_rpg/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final _nameController = TextEditingController();
  final _sloganController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _sloganController.dispose();
    super.dispose();
  }

  // handling select vocation

  Vocation selectedVocation = Vocation.junkie;

  void updateVocation(Vocation vocation) {
    setState(() {
      selectedVocation = vocation;
    });
  }

  // handler
  void handleSubmit() {
    if (_nameController.text.trim().isEmpty) {
      //error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading("Missing Shogird name"),
            content: const StyledText("Every good Shogird needs a name.😂"),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx); // close dialog
                },
                child: const StyledText("Close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );

      return;
    }
    if (_sloganController.text.trim().isEmpty) {
      //error dialog
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const StyledHeading("Missing Shogird slogan name"),
            content: const StyledText("Every good Shogird needs a slogan.😳"),
            actions: [
              StyledButton(
                onPressed: () {
                  Navigator.pop(ctx); // close dialog
                },
                child: const StyledText("Close"),
              ),
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
      return;
    }

    Provider.of<CharacterStore>(context, listen: false)
    .addCharacter(
      Character(
        name: _nameController.text.trim(),
        slogan: _sloganController.text.trim(),
        vocation: selectedVocation,
        id: uuid.v4(),
      ),
    );

    Navigator.push(context, MaterialPageRoute(builder: (ctx) => const Home()));
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
        child: SingleChildScrollView(
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
                child: StyledText("This determins your available skills"),
              ),
              const SizedBox(height: 30),

              // vocation cards
              VocationCard(
                selected: selectedVocation == Vocation.junkie,
                onTap: updateVocation,
                vocation: Vocation.junkie,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.ninja,
                onTap: updateVocation,
                vocation: Vocation.ninja,
              ),
              VocationCard(
                selected: selectedVocation == Vocation.raider,
                onTap: updateVocation,
                vocation: Vocation.raider,
              ),
              VocationCard(
                onTap: updateVocation,
                selected: selectedVocation == Vocation.wizard,
                vocation: Vocation.wizard,
              ),
              const SizedBox(height: 40),

              // welcome
              Center(child: Icon(Icons.code, color: AppColors.primaryColor)),
              const Center(child: StyledHeading("Omad!")),
              const Center(child: StyledText("Shgird yaratishdan to'xtama...")),
              const SizedBox(height: 30),

              Center(
                child: StyledButton(
                  onPressed: handleSubmit,
                  child: StyledHeading("Create shogird"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
