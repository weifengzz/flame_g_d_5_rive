import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame {
  @override
  Future<void>? onLoad() async {
    super.onLoad();

    for (var i = 0; i < 800; i += 200) {
      Artboard carrotArtBorard = await loadArtboard(
        RiveFile.asset('ro.riv'),
      );
      CarrotComponent carrotComponent =
          CarrotComponent(carrotArtboard: carrotArtBorard)
            ..size = Vector2.all(200);

      carrotComponent.y = i.toDouble();
      OneShotAnimation carrotController = OneShotAnimation(
        'Animation 2',
        autoplay: true,
      );
      carrotArtBorard.addController(carrotController);
      add(carrotComponent);
    }
  }

  @override
  Color backgroundColor() => const Color.fromRGBO(148, 147, 110, 1);
}

class CarrotComponent extends RiveComponent with HasGameRef {
  CarrotComponent({required this.carrotArtboard})
      : super(
          artboard: carrotArtboard,
          size: Vector2.all(200),
        );
  final Artboard carrotArtboard;
  @override
  void update(double dt) {
    super.update(dt);
    x += 1;
    print(x);
    print(gameRef.size[0]);
    if (x > gameRef.size[0] - 200) {
      gameRef.remove(this);
    }
  }
}
