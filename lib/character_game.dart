import 'package:flame_g_d_5_rive/main_game.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class CharacterGameControls extends StatefulWidget {
  final MainGame mainGame;
  const CharacterGameControls({
    Key? key,
    required this.mainGame,
  }) : super(key: key);

  @override
  State<CharacterGameControls> createState() => _CharacterGameControlsState();
}

class _CharacterGameControlsState extends State<CharacterGameControls> {
  bool _characterAdded = false;
  late RiveAnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation(
      'show',
      autoplay: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !_characterAdded
          ? IconButton(
              iconSize: 200.0,
              onPressed: () {
                widget.mainGame.showCharacter = true;
                setState(() {
                  _characterAdded = true;
                });

              },
              icon: const Icon(Icons.check_circle),
            )
          : const SizedBox(
              width: 370.0,
              height: 370.0,
              child: RiveAnimation.asset('check.riv'),
            ),
    );
  }
}
