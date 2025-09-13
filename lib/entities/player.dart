import 'package:nyora/world/position.dart';

class Player {
  Position position;
  final String name;
  String char = '@';

  Player(this.position, this.name);

  Position get pos => position;
  set setPos(Position newPos) => position = newPos;
}