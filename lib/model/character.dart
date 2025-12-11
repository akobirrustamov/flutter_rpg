import 'package:flutter_rpg/model/stat.dart';
import 'package:flutter_rpg/model/vocation.dart';

class Character with Stats {
  // constructor
  Character({required this.name, required this.slogan, required this.vocation, required this.id});
  // fields
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
}
