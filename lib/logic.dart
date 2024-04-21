import 'package:flutter/material.dart';

enum Piece { L, I, O, T, S, J }

enum Direction { left, right, down }

final typeColors = {
  Piece.L: Color.fromARGB(255, 255, 145, 0),
  Piece.I: Color.fromARGB(255, 23, 202, 208),
  Piece.O: Color.fromARGB(255, 170, 146, 255),
  Piece.T: Color.fromARGB(255, 255, 225, 2),
  Piece.S: const Color.fromARGB(255, 5, 189, 11),
  Piece.J: Color.fromARGB(255, 255, 1, 175),
};
