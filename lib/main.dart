import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:mario_bros/src/mario_game.dart';

void main() {
  runApp(MarioBrosGame());
}

class MarioBrosGame extends StatelessWidget {
  MarioBrosGame({Key? key}) : super(key: key);

  final MarioGame _game = MarioGame();

  @override
  Widget build(BuildContext context) {
    return GameWidget(game: _game);
  }
}
