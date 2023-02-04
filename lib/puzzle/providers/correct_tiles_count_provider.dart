import 'package:dashtronaut/puzzle/providers/tiles_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final correctTilesCountProvider = Provider<int>((ref) {
  final tilesState = ref.watch(tilesProvider);

  return tilesState.correctTilesCount;
});
