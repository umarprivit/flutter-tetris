//  This class is for generating the pieces

import 'package:tetrismini/gamescreen.dart';
import 'package:tetrismini/logic.dart';

class PieceObject {
  static const rows = 16;
  static const cols = 10;
  Piece type;
  PieceObject({required this.type});

  List<int> position = [];

  List<int> generatePiece() {
    switch (type) {
      case (Piece.J):
        position = [3 - 30, 13 - 30, 23 - 30, 22 - 30];
        break;
      case (Piece.L):
        position = [1 - 30, 11 - 30, 21 - 30, 22 - 30];
        break;
      case (Piece.I):
        position = [-3, -4, -5, -6];
        break;
      case (Piece.S):
        position = [6 - 20, 7 - 20, 15 - 20, 16 - 20];
        break;
      case (Piece.O):
        position = [3 - 20, 4 - 20, 13 - 20, 14 - 20];
        break;
      case (Piece.T):
        position = [3 - 10, 4 - 10, 5 - 10, 14 - 10];
        break;
      default:
    }
    return position;
  }

  int rotationState = 1;
  void rotatePiece() {
    List<int> newPosition = [];

    switch (type) {
      case Piece.J:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + cols,
              position[1] + cols - 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - cols - 1,
              position[1],
              position[1] - 1,
              position[1] + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + cols,
              position[1],
              position[1] - cols,
              position[1] - cols + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] + cols + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }
      case Piece.I:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + cols,
              position[1] + 2 * cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] - 2
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] + cols,
              position[1],
              position[1] - cols,
              position[1] - 2 * cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }

      case Piece.S:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + cols - 1,
              position[1] + cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + 1,
              position[1] + cols + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + cols - 1,
              position[1] + cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + 1,
              position[1] + cols + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }

      case Piece.T:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + 1,
              position[1] + cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - cols,
              position[1] - 1,
              position[1],
              position[1] + cols
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] - cols,
              position[1] - 1,
              position[1],
              position[1] + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }

      case Piece.L:
        switch (rotationState) {
          case 0:
            newPosition = [
              position[1] - cols,
              position[1],
              position[1] + cols,
              position[1] + cols + 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + cols - 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + cols,
              position[1],
              position[1] - cols,
              position[1] - cols - 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;

          case 3:
            newPosition = [
              position[1] - cols + 1,
              position[1],
              position[1] + 1,
              position[1] - 1
            ];
            if (pieceValid(newPosition)) {
              position = newPosition;
              rotationState = (rotationState + 1) % 4;
            }
            break;
        }

      default:
    }
  }

  bool isValid(int position) {
    final g = GameScreenStateState();
    var row = (position / cols).floor();
    var col = position % cols;

    if (row < 0 || col < 0 || g.GameBoard[row][col] != null) {
      return false;
    } else {
      return true;
    }
  }

  bool pieceValid(List pieces) {
    bool firstColumn = false;
    bool lastColumn = false;

    for (var i in pieces) {
      if (!isValid(i)) {
        return false;
      }

      int col = i % cols;

      if (col == 0) {
        firstColumn = true;
      }
      if (col == cols - 1) {
        lastColumn = true;
      }
    }
    return !(firstColumn && lastColumn);
  }
}
