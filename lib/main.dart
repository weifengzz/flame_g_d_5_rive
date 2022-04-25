import 'package:flame/game.dart';
import 'package:flame_g_d_5_rive/main_game.dart';
import 'package:flutter/material.dart';

import 'character_game.dart';

void main() {
  MainGame game = MainGame();
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 2,
              child: CharacterGameControls(mainGame: game,),
            ),
            Expanded(
              flex: 6,
              child: GameWidget(
                game: game,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
