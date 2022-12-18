import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:mario_bros/src/view/game_view.dart';
import 'package:mario_bros/src/view/player/mario.dart';

class MarioGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  late final Image gameSpriteImage;

  @override
  Color backgroundColor() => const Color(0xFF7284F0);

  @override
  void onGameResize(Vector2 canvasSize) {
    setGameScale(canvasSize.x);
    super.onGameResize(canvasSize);
  }

  @override
  Future<void>? onLoad() async {
    gameSpriteImage = await Flame.images.load(marioGameImage);
    print('gameScale=$gameScale');

    add(MarioComponent(gridPosition: Vector2(1, 1)));
    add(MarioComponent(gridPosition: Vector2(2, 1)));
    add(MarioComponent(gridPosition: Vector2(3, 1)));
    add(MarioComponent(gridPosition: Vector2(4, 1)));
  }
}
