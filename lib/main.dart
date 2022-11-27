import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mario_bros/src/klondike_game.dart';

void main() {
  runApp(MarioBrosGame());
}

class MarioBrosGame extends StatelessWidget {
  MarioBrosGame({Key? key}) : super(key: key);

  final FlameGame _game = KlondikeGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _game);
  }
}
