import 'package:Dashtronaut/models/tile.dart';
import 'package:Dashtronaut/presentation/common/animations/utils/animations_manager.dart';
import 'package:Dashtronaut/presentation/common/animations/widgets/pulse_transition.dart';
import 'package:Dashtronaut/presentation/common/animations/widgets/scale_up_transition.dart';
import 'package:Dashtronaut/presentation/layout/puzzle_layout.dart';
import 'package:Dashtronaut/presentation/providers/puzzle_provider.dart';
import 'package:Dashtronaut/presentation/tile/tile_animated_positioned.dart';
import 'package:Dashtronaut/presentation/tile/tile_content.dart';
import 'package:Dashtronaut/presentation/tile/tile_gesture_detector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PuzzleBoard extends StatelessWidget {
  PuzzleBoard({Key? key}) : super(key: key);

  final FocusNode keyboardListenerFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ScaleUpTransition(
      delay: AnimationsManager.bgLayerAnimationDuration,
      child: Consumer<PuzzleProvider>(
        builder: (c, PuzzleProvider puzzleProvider, _) => RawKeyboardListener(
          onKey: puzzleProvider.handleKeyboardEvent,
          focusNode: keyboardListenerFocusNode,
          child: Center(
            child: SizedBox(
              width: PuzzleLayout.containerWidth(context),
              height: PuzzleLayout.containerWidth(context),
              child: Stack(
                children: List.generate(
                  puzzleProvider.tilesWithoutWhitespace.length,
                  (index) {
                    Tile _tile = puzzleProvider.tilesWithoutWhitespace[index];
                    return TileAnimatedPositioned(
                      tile: _tile,
                      isPuzzleSolved: puzzleProvider.puzzle.isSolved,
                      puzzleSize: puzzleProvider.n,
                      tileGestureDetector: TileGestureDetector(
                        tile: puzzleProvider.tilesWithoutWhitespace[index],
                        tileContent: PulseTransition(
                          isActive: puzzleProvider.puzzle.tileIsMovable(_tile) && !puzzleProvider.puzzle.isSolved,
                          child: TileContent(
                            tile: _tile,
                            isPuzzleSolved: puzzleProvider.puzzle.isSolved,
                            puzzleSize: puzzleProvider.n,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
