import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tetrismini/backgroundboxes.dart';
import 'package:tetrismini/logic.dart';
import 'package:tetrismini/pieceobject.dart';

class GameScreenState extends StatefulWidget {
  const GameScreenState({super.key});

  @override
  State<GameScreenState> createState() => GameScreenStateState();
}

class GameScreenStateState extends State<GameScreenState> {
  List<int> piece = [];
  static const rows = 16;
  static const cols = 10;
  int score = 0;
  bool gameover = false;
  List<List<Piece?>> GameBoard =
      List.generate(rows, (i) => List.generate(cols, (j) => null));
  var pob;

  @override
  void initState() {
    super.initState();

    startGame();
  }

  void startGame() {
    createNewPiece();
    Game();
  }

  // i use that for generating a I shape Piece and start the game

  void giveDirections(Direction direction) {
    switch (direction) {
      case Direction.down:
        for (int i = 0; i < piece.length; i++) {
          piece[i] += 10;
        }
        break;
      case Direction.left:
        for (int i = 0; i < piece.length; i++) {
          piece[i] -= 1;
        }
        break;
      case Direction.right:
        for (int i = 0; i < piece.length; i++) {
          piece[i] += 1;
        }
        break;
    }
  }

  bool checkCollisions(Direction direction) {
    for (int i = 0; i < piece.length; i++) {
      var row = (piece[i] / cols).floor();
      var col = piece[i] % cols;

      if (direction == Direction.left) {
        col -= 1;
      } else if (direction == Direction.down) {
        row += 1;
      } else if (direction == Direction.right) {
        col += 1;
      }
      if (row > 0) {
        if (row > rows - 1 ||
            col < 0 ||
            col > cols - 1 ||
            GameBoard[row][col] != null) {
          return true;
        }
      }
    }

    return false;
  }

  void checkreached() {
    if (checkCollisions(Direction.down)) {
      for (int i = 0; i < piece.length; i++) {
        var row = (piece[i] / cols).floor();
        var col = piece[i] % cols;
        if (row >= 0 && col >= 0) {
          pob.rotationState = 1;
          GameBoard[row][col] = pob.type;
        }
      }
      createNewPiece();
    }
  }

  // void clearLines() {
  //   for (int row = cols - 1; rows >= 0; row--) {
  //     bool isFull = true;

  //     for (int col = 0; col < cols; col++) {
  //       if (GameBoard[row][col] == null) {
  //         isFull = false;
  //         break;
  //       }
  //     }

  //     if (isFull) {
  //       for (var i = row; i > 0; i--) {
  //         GameBoard[i] = List.from(GameBoard[i - 1]);
  //       }
  //       GameBoard[0] = List.generate(row, (index) => null);

  //       score++;
  //     }
  //   }
  // }

  void clearLines() {
    for (int row = rows - 1; row >= 0; row--) {
      bool isFull = true;

      for (int col = 0; col < cols; col++) {
        if (GameBoard[row][col] == null) {
          isFull = false;
          break;
        }
      }

      if (isFull) {
        for (int i = row; i > 0; i--) {
          GameBoard[i] = List.from(GameBoard[i - 1]);
        }
        GameBoard[0] = List.generate(cols, (index) => null);

        score++;
      }
    }
  }

  void createNewPiece() {
    Random random = Random();

    pob = PieceObject(type: Piece.values[random.nextInt(Piece.values.length)]);
    piece = pob.generatePiece();

    if (isOver()) {
      gameover = true;
    }
  }

  //This starts a timer that moves the piece down
  void Game() {
    Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        clearLines();
        checkreached();
        if (gameover == true) {
          timer.cancel();
          showOverDialog();
        }
        giveDirections(Direction.down);
      });
    });
  }

//  These Methods are for moving the piece left and right
  void onright() {
    setState(() {
      if (checkCollisions(Direction.right)) {
        return;
      } else {
        giveDirections(Direction.right);
      }
    });
  }

  void onleft() {
    setState(() {
      if (checkCollisions(Direction.left)) {
        return;
      } else {
        giveDirections(Direction.left);
      }
    });
  }

  void rotate() {
    setState(() {
      pob.rotatePiece();
      piece = pob.position;
    });
  }

  void showOverDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        content: Text("Your score is $score"),
        actions: [
          TextButton(
              onPressed: () {
                resetGame();
                Navigator.pop(context);
              },
              child: const Text("Play Again"))
        ],
      ),
    );
  }

  void resetGame() {
    GameBoard = List.generate(rows, (i) => List.generate(cols, (j) => null));
    gameover = false;
    score = 0;
    createNewPiece();
    startGame();
  }

  bool isOver() {
    for (int i = 0; i < cols; i++) {
      if (GameBoard[0][i] != null) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: cols,
                ),
                itemCount: rows * cols,
                itemBuilder: (BuildContext context, int index) {
                  var row = (index / cols).floor();
                  var col = index % cols;
                  var PieceType = GameBoard[row][col];

                  if (piece.contains(index)) {
                    return BgBoxes(colors: typeColors[pob.type]!);
                  } else if (GameBoard[row][col] != null) {
                    return BgBoxes(colors: typeColors[PieceType]!);
                  } else {
                    return BgBoxes(
                        colors: const Color.fromARGB(255, 47, 47, 47));
                  }
                },
              ),
            ),
            Text(
              "Score : $score",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: onleft,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: rotate,
                    child: const Icon(
                      Icons.rotate_right_rounded,
                      color: Colors.white,
                      size: 70,
                    ),
                  ),
                  InkWell(
                    onTap: onright,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white,
                        size: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
