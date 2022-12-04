import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:mario_bros/src/game_controller.dart';
import 'package:mario_bros/src/player/mario/mario.dart';
import 'package:mario_bros/src/player/player.dart';
import 'package:mario_bros/src/player/running_direction.dart';

class MarioGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  late final Image spriteImage;

  late final Player player;

  final double startSpeed = 600;

  @override
  Color backgroundColor() {
    return const Color(0xFF7284F0);
  }

  @override
  Future<void>? onLoad() async {
    spriteImage = await Flame.images.load('mario_sprites.gif');
    add(player = Mario());
  }

  @override
  KeyEventResult onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    final isKeyDown = event is RawKeyDownEvent;
    if (isKeyDown) {
      // 跳跃
      if (isJumpingKeyPressed(keysPressed)) {
        player.jump(startSpeed, RunningDirection.none);
      }
      // 向左奔跑
      else if (isRunningLeftKeyPressed(keysPressed)) {
        player.run(startSpeed, RunningDirection.left);
      }
      // 向右奔跑
      else if (isRunningRightKeyPressed(keysPressed)) {
        player.run(startSpeed, RunningDirection.right);
      }
    } else {
      player.reset();
    }

    return KeyEventResult.handled;
  }
}
