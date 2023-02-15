import 'dart:async';

import 'package:bubble_trouble/ball.dart';
import 'package:bubble_trouble/button.dart';
import 'package:bubble_trouble/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'missile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum direction { LEFT, RIGHT }

class _HomePageState extends State<HomePage> {
  static double playerX = 0;

  double missileX = playerX;
  double missileHeight = 10;
  bool midShot = false;

  double ballX = 0.5;
  double ballY = 1;
  bool isGameHasStarted = false;

  void moveLeft() {
    setState(() {
      if (playerX - 0.1 < -1) {
        //
      } else {
        playerX -= 0.1;
      }
      if (!midShot) {
        missileX = playerX;
      }
    });
  }

  void moveRight() {
    setState(() {
      if (playerX + 0.1 > 1) {
      } else {
        playerX += 0.1;
      }
      if (!midShot) {
        missileX = playerX;
      }
    });
  }

  void resetMissile() {
    missileX = playerX;
    midShot = false;
    missileHeight = 10;
  }

  void fire() {
    if (!midShot) {
      if(isGameHasStarted) {
        Timer.periodic(const Duration(milliseconds: 100), (timer) {
        midShot = true;

        setState(() {
          // missileY -= 0.1;
          missileHeight += 10;
        });

        if (missileHeight > MediaQuery.of(context).size.height * 3 / 4) {
          resetMissile();
          timer.cancel();
        }

        if (ballY > heightToPosition(missileHeight) &&
            (ballX - missileX).abs() < 0.03) {
          resetMissile();
          ballX = 5;
          timer.cancel();
        }
      });
      }
    }
  }

  var ballDirection = direction.LEFT;

  heightToPosition(double height) {
    double totalHeight = MediaQuery.of(context).size.height * 3 / 4;
    double position = 1 - 2 * height / totalHeight;
    return position;
  }

  bool playerDies() {
    if ((ballX - playerX).abs() < 0.05 && ballY > 0.95) {
      setState(() {
        isGameHasStarted = false;
      });
      return true;
    }
    return false;
  }

  startGame() {
    setState(() {
      isGameHasStarted = true;
    });

    double time = 0;
    double height = 0;
    double velocity = 70;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      height = -5 * time * time + velocity * time;

      if (height < 0) {
        time = 0;
      }

      setState(() {
        ballY = heightToPosition(height);
      });

      if (ballX - 0.005 < -1) {
        ballDirection = direction.RIGHT;
      } else if (ballX + 0.005 > 1) {
        ballDirection = direction.LEFT;
      }

      if (playerDies()) {
        timer.cancel();
        _showDialog();
      }

      setState(() {
        if (ballDirection == direction.LEFT) {
          ballX -= 0.005;
        } else if (ballDirection == direction.RIGHT) {
          ballX += 0.005;
        }
      });

      time += 0.1;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.grey,
            title: const Center(
              child: Text("you made it"),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      ballX = 0.5;
                      playerX = 0;
                      isGameHasStarted = true;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Restart"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: FocusNode(),
      autofocus: true,
      onKey: (event) {
        if (event.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          moveLeft();
        } else if (event.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          moveRight();
        } else if (event.isKeyPressed(LogicalKeyboardKey.space)) {
          fire();
        }
      },
      child: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.pink.shade200,
                child: Stack(
                  children: [
                    MyBall(ballX: ballX, ballY: ballY),
                    MyMissile(missileX: missileX, missileHeight: missileHeight),
                    MyPlayer(playerX: playerX),
                  ],
                ),
              )),
          Expanded(
              child: Container(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(
                  icon: Icons.arrow_back,
                  function: () => moveLeft(),
                ),
                MyButton(
                  icon: Icons.play_arrow,
                  function: () => startGame(),
                ),
                MyButton(
                  icon: Icons.arrow_upward,
                  function: () => fire(),
                ),
                MyButton(
                  icon: Icons.arrow_forward,
                  function: () => moveRight(),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
