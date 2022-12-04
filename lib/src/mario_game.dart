import 'dart:ui';

import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/material.dart' hide Image;
import 'package:flutter/services.dart';
import 'package:mario_bros/src/player/mario/mario.dart';
import 'package:mario_bros/src/player/player.dart';

class MarioGame extends FlameGame with KeyboardEvents, HasCollisionDetection {
  late final Image spriteImage;

  late final Player player;

  final double startSpeed = 600;

  static final List<LogicalKeyboardKey> arrowKeys = [
    LogicalKeyboardKey.arrowDown,
    LogicalKeyboardKey.arrowUp,
    LogicalKeyboardKey.arrowLeft,
    LogicalKeyboardKey.arrowRight,
  ];

  static final List<LogicalKeyboardKey> movementKeys = [
    LogicalKeyboardKey.keyW,
    LogicalKeyboardKey.keyS,
    LogicalKeyboardKey.keyA,
    LogicalKeyboardKey.keyD,
  ];

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
    // 跳跃
    if (_isJumpingKeyPressed(keysPressed)) {
      player.jump(startSpeed, MoveDirection.none);
    }
    return KeyEventResult.handled;
  }

  bool _isJumpingKeyPressed(Set<LogicalKeyboardKey> keysPressed) {
    return keysPressed.contains(LogicalKeyboardKey.arrowUp) ||
        keysPressed.contains(LogicalKeyboardKey.keyW);
  }

  bool _isMovementKeyPressed(Set<LogicalKeyboardKey> keysPressed) {
    return _containsKey(keysPressed, arrowKeys) ||
        _containsKey(keysPressed, movementKeys);
  }

  bool _containsKey(
      Set<LogicalKeyboardKey> keysPressed, List<LogicalKeyboardKey> validKeys) {
    for (LogicalKeyboardKey arrowKey in keysPressed) {
      if (validKeys.contains(arrowKey)) {
        return true;
      }
    }
    return false;
  }
}
