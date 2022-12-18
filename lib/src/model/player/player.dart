import 'package:flame/components.dart';
import 'package:mario_bros/src/model/const.dart';

enum PlayerState {
  waiting('waiting'),
  running('running'),
  jumping('jumping'),
  crashed('crashed');

  final String value;

  const PlayerState(this.value);
}

enum PlayerMode {
  normal('normal'),
  large('large'),
  power('power');

  final String value;

  const PlayerMode(this.value);
}

class Player {
  static const _horizontalSpeed = 500.0;
  static const _verticalSpeed = 50.0;

  Player();

  PlayerState _playerState = PlayerState.waiting;
  PlayerMode _playerMode = PlayerMode.normal;
  Vector2 _velocity = Vector2.zero();

  String get currentState => "${_playerState.value}#${_playerMode.value}";

  Vector2 get velocity => _velocity;

  /// 跑动
  void run(MoveDirection direction) {
    _playerState = PlayerState.running;
    _velocity.x = _horizontalSpeed * direction.value;
  }

  /// 等待
  void wait() {
    _playerState = PlayerState.waiting;
    _velocity.x = 0;
    _velocity.y = 0;
  }

  /// 跳跃
  void jump() {
    _playerState = PlayerState.jumping;
    _velocity.y = _verticalSpeed;
  }

  /// 失败
  void crash() {
    _playerState = PlayerState.crashed;
    _velocity.x = 0;
    _velocity.y = 0;
  }
}
