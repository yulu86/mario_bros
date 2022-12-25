import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:mario_bros/src/view/game_view.dart';
import 'package:mario_bros/src/view/player/mario_component.dart';

class MarioGame extends FlameGame
    with HasKeyboardHandlerComponents, HasCollisionDetection {
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

    add(MarioComponent(gridPosition: Vector2(1, 1)));
  }
}
