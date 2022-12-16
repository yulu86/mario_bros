import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class MarioGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  late final Image spriteImage;

  @override
  Color backgroundColor() => const Color(0xFF7284F0);

  @override
  Future<void>? onLoad() async {
    spriteImage = await Flame.images.load('mario_sprites.gif');
  }
}
