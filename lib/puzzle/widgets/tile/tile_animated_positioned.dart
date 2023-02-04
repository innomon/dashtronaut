import 'package:dashtronaut/puzzle/models/position.dart';
import 'package:dashtronaut/puzzle/models/tile.dart';
import 'package:dashtronaut/core/layout/puzzle_layout.dart';
import 'package:flutter/material.dart';

class TileAnimatedPositioned extends StatelessWidget {
  final Tile tile;
  final bool isPuzzleSolved;
  final int puzzleSize;
  final Widget tileGestureDetector;

  const TileAnimatedPositioned({
    super.key,
    required this.tile,
    required this.isPuzzleSolved,
    required this.puzzleSize,
    required this.tileGestureDetector,
  });

  @override
  Widget build(BuildContext context) {
    double tileWidth = PuzzleLayout(context).containerWidth / puzzleSize;
    Position tilePosition = tile.getPosition(context, tileWidth);

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      width: tileWidth,
      height: tileWidth,
      left: tilePosition.left,
      top: tilePosition.top,
      child: tileGestureDetector,
    );
  }
}
