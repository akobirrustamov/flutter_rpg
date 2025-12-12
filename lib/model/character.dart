import 'package:flutter_rpg/model/skill.dart';
import 'package:flutter_rpg/model/stat.dart';
import 'package:flutter_rpg/model/vocation.dart';

class Character with Stats {
  // constructor
  Character({
    required this.name,
    required this.slogan,
    required this.vocation,
    required this.id,
  });
  // fields
  final Set<Skill> skills = {};
  final Vocation vocation;
  final String name;
  final String slogan;
  final String id;
  bool _isFav = false;

  // getters
  bool get isFav => _isFav;

  // method
  void toggleIsFav() {
    _isFav = !_isFav;
  }

  void updateSkill(Skill skill) {
    skills.clear();
    skills.add(skill);
  }
}

List<Character> characters = [
    Character(id: "1", name: "Diyor", vocation: Vocation.wizard, slogan: "Qattiq"),
    Character(id: "2", name: "Asil", vocation: Vocation.junkie, slogan: "Norm"),
    Character(id: "3", name: "Ozod", vocation: Vocation.ninja, slogan: "Norm sila.."),
    Character(id: "4", name: "Sardor", vocation: Vocation.raider, slogan: "Slabi"),
    Character(id: "5", name: "Linux", vocation: Vocation.wizard, slogan: "ux ux")

  ];