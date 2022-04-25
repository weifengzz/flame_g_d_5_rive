import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

class MainGame extends FlameGame {
  bool showCharacter = false;

  SpriteComponent character = SpriteComponent();

  @override
  Future<void>? onLoad() async {
    super.onLoad();
    character
      ..sprite = await loadSprite('woman.png')
      ..position = Vector2.all(0.0)
      ..size = Vector2.all(300.0);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    if (showCharacter) {
      add(character);
      showCharacter = false;
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    character.x += 1;
  }
}
