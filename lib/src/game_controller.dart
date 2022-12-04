import 'package:flutter/services.dart';

/// 跳跃按键
final List<LogicalKeyboardKey> jumpingKeys = [
  LogicalKeyboardKey.arrowUp,
  LogicalKeyboardKey.keyW,
];

/// 向左奔跑按键
final List<LogicalKeyboardKey> runningLeftKeys = [
  LogicalKeyboardKey.arrowLeft,
  LogicalKeyboardKey.keyA,
];

/// 向右奔跑按键
final List<LogicalKeyboardKey> runningRightKeys = [
  LogicalKeyboardKey.arrowRight,
  LogicalKeyboardKey.keyD,
];

/// 下蹲按键
final List<LogicalKeyboardKey> squatKeys = [
  LogicalKeyboardKey.arrowDown,
  LogicalKeyboardKey.keyS,
];

/// 是否跳跃键
bool isJumpingKeyPressed(Set<LogicalKeyboardKey> keysPressed) {
  return _containsKey(keysPressed, jumpingKeys);
}

/// 是否向左奔跑键
bool isRunningLeftKeyPressed(Set<LogicalKeyboardKey> keysPressed) {
  return _containsKey(keysPressed, runningLeftKeys);
}

/// 是否向右奔跑键
bool isRunningRightKeyPressed(Set<LogicalKeyboardKey> keysPressed) {
  return _containsKey(keysPressed, runningRightKeys);
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
