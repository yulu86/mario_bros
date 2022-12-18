import 'dart:ui';

import 'package:flame/palette.dart';

/// 精灵图
const marioGameImage = 'mario_sprites.gif';

/// 碰撞检测画笔
final hitboxPaint = BasicPalette.yellow.paint()..style = PaintingStyle.stroke;

/// 是否渲染碰撞检测形状
const renderHitboxShape = false;

/// 缩放大小
double gameScale = 4.5;

void setGameScale(double width) {
  gameScale = (width / (17 * 16 * 2.5)).clamp(2, 4.5);
}

/// 单元大小
double get unitSize => 16.0 * gameScale;
