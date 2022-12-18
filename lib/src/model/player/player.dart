import 'package:flame/components.dart';
import 'package:mario_bros/src/model/const.dart';

enum PlayerCharacter {
  mario,
  luigi,
}

enum PlayerState {
  // 0
  waiting,
  // 1
  running,
  // 2
  jumping,
  // 3
  crashed,
}

enum PlayerMode {
  // 0
  normal,
  // 1
  large,
  // 3
  power,
}

class Player {
  static const _horizontalSpeed = 500.0;
  static const _verticalSpeed = 50;

  Player({required this.character});

  final PlayerCharacter character;

  PlayerState _playerState = PlayerState.waiting;
  PlayerMode _playerMode = PlayerMode.normal;
  Vector2 _velocity = Vector2.zero();

  PlayerState get playerState => _playerState;

  PlayerMode get playerMode => _playerMode;

  void run(MoveDirection direction) {
    _velocity.x = _horizontalSpeed * _directionValue(direction);
  }

  void wait() {
    _velocity.x = 0;
    _velocity.y = 0;
  }

  void jump() {
    _velocity.y = _horizontalSpeed;
  }

  int _directionValue(MoveDirection direction) {
    return direction == MoveDirection.left ? -1 : 1;
  }
}
