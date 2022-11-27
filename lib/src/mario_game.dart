import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';

class MarioGame extends FlameGame {
  // late Image _marioImage;

  @override
  Future<void>? onLoad() async {
    final sprite = await loadSprite('mario_sprites.gif');
    add(
      SpriteComponent(
        sprite: sprite,
        position: size / 2,
        size: sprite.srcSize * 2,
        anchor: Anchor.center,
      ),
    );
  }
}
